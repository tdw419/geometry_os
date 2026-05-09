; DESCRIPTION: Composite: Places a green 78x39 rectangle at position (12, 80) then Sets a single orange pixel at (96, 69).
; PLAN: r0=12(x), r1=80(y), r2=78(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=69(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 80
LDI r2, 78
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 69
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
