; DESCRIPTION: Composite: Places a white 13x69 rectangle at position (6, 95) then Sets a single magenta pixel at (90, 205).
; PLAN: r0=6(x), r1=95(y), r2=13(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=205(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 95
LDI r2, 13
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 205
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
