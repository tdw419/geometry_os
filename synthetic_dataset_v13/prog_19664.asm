; DESCRIPTION: Composite: Draws a green circle centered at (363, 98) with radius 54 then Draws a orange line from (237, 57) to (90, 200).
; PLAN: r0=363(x), r1=98(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=57(y1), r7=90(x2), r8=200(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 98
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 57
LDI r7, 90
LDI r8, 200
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
