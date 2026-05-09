; DESCRIPTION: Composite: Creates a black circular shape at (388, 97) with radius 46 then Draws a red line from (359, 200) to (320, 189).
; PLAN: r0=388(x), r1=97(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=200(y1), r7=320(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 97
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 200
LDI r7, 320
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
