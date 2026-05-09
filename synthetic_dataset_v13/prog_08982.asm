; DESCRIPTION: Composite: Draws a red line from (98, 160) to (470, 9) then Creates a yellow circular shape at (72, 192) with radius 11.
; PLAN: r0=98(x1), r1=160(y1), r2=470(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=192(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 160
LDI r2, 470
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 192
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
