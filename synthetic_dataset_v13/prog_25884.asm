; DESCRIPTION: Composite: Places a blue dot at position (491, 19) then Draws a cyan line from (260, 222) to (364, 154) then Renders a orange disk with center (256, 219) and radius 36.
; PLAN: r0=491(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=260(x1), r6=222(y1), r7=364(x2), r8=154(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=219(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 491
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 222
LDI r7, 364
LDI r8, 154
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 219
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
