; DESCRIPTION: Composite: Renders a green disk with center (464, 208) and radius 10 then Draws a magenta line from (130, 40) to (369, 193) then Draws a magenta rectangle at (233, 183) with width 76 and height 19.
; PLAN: r0=464(x), r1=208(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=40(y1), r7=369(x2), r8=193(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=183(y), r12=76(width), r13=19(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 208
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 40
LDI r7, 369
LDI r8, 193
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 183
LDI r12, 76
LDI r13, 19
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
