; DESCRIPTION: Composite: Renders a green line between points (315, 198) and (25, 103) then Creates a black circular shape at (173, 97) with radius 63.
; PLAN: r0=315(x1), r1=198(y1), r2=25(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=97(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 198
LDI r2, 25
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 97
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
