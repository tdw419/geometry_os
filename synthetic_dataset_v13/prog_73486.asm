; DESCRIPTION: Composite: Renders a orange disk with center (91, 193) and radius 63 then Places a blue line segment connecting (319, 177) to (428, 230) then Draws a yellow rectangle at (206, 53) with width 52 and height 26.
; PLAN: r0=91(x), r1=193(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=177(y1), r7=428(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=53(y), r12=52(width), r13=26(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 193
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 177
LDI r7, 428
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 53
LDI r12, 52
LDI r13, 26
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
