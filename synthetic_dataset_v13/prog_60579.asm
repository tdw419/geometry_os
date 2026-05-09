; DESCRIPTION: Composite: Renders a blue disk with center (192, 153) and radius 23 then Places a orange line segment connecting (121, 240) to (283, 113).
; PLAN: r0=192(x), r1=153(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x1), r6=240(y1), r7=283(x2), r8=113(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 153
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 240
LDI r7, 283
LDI r8, 113
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
