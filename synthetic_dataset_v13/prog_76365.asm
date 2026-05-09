; DESCRIPTION: Composite: Renders a white box of size 79x60 starting at (334, 137) then Draws a orange line from (15, 147) to (331, 44) then Renders a magenta disk with center (146, 129) and radius 36.
; PLAN: r0=334(x), r1=137(y), r2=79(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=147(y1), r7=331(x2), r8=44(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=129(y), r12=36(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 137
LDI r2, 79
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 147
LDI r7, 331
LDI r8, 44
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 129
LDI r12, 36
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
