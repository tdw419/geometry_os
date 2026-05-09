; DESCRIPTION: Composite: Renders a magenta disk with center (273, 100) and radius 62 then Places a green dot at position (470, 192) then Draws a yellow line from (29, 122) to (416, 106).
; PLAN: r0=273(x), r1=100(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=192(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=29(x1), r11=122(y1), r12=416(x2), r13=106(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 100
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 192
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 29
LDI r11, 122
LDI r12, 416
LDI r13, 106
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
