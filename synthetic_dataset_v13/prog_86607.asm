; DESCRIPTION: Composite: Places a yellow 70x67 rectangle at position (258, 19) then Sets a single magenta pixel at (65, 137).
; PLAN: r0=258(x), r1=19(y), r2=70(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=137(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 19
LDI r2, 70
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 137
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
