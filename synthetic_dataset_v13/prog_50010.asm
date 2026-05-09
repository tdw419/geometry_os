; DESCRIPTION: Composite: Draws a purple line from (74, 23) to (492, 211) then Creates a purple circular shape at (104, 38) with radius 27.
; PLAN: r0=74(x1), r1=23(y1), r2=492(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=38(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 23
LDI r2, 492
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 38
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
