; DESCRIPTION: Composite: Creates a cyan circular shape at (470, 76) with radius 36 then Draws a orange line from (77, 118) to (359, 134).
; PLAN: r0=470(x), r1=76(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x1), r6=118(y1), r7=359(x2), r8=134(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 76
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 118
LDI r7, 359
LDI r8, 134
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
