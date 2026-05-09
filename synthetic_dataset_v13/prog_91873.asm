; DESCRIPTION: Composite: Renders a blue disk with center (403, 84) and radius 75 then Places a magenta dot at position (439, 183) then Places a orange line segment connecting (144, 12) to (198, 7).
; PLAN: r0=403(x), r1=84(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=144(x1), r11=12(y1), r12=198(x2), r13=7(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 84
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 144
LDI r11, 12
LDI r12, 198
LDI r13, 7
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
