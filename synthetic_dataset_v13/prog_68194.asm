; DESCRIPTION: Composite: Renders a purple disk with center (387, 78) and radius 54 then Draws a orange line from (91, 17) to (498, 104).
; PLAN: r0=387(x), r1=78(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x1), r6=17(y1), r7=498(x2), r8=104(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 78
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 17
LDI r7, 498
LDI r8, 104
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
