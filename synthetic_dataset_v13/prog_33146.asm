; DESCRIPTION: Composite: Draws a green line from (395, 97) to (117, 185) then Renders a yellow box of size 19x23 starting at (343, 93).
; PLAN: r0=395(x1), r1=97(y1), r2=117(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=93(y), r7=19(width), r8=23(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 97
LDI r2, 117
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 93
LDI r7, 19
LDI r8, 23
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
