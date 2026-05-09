; DESCRIPTION: Composite: Draws a blue line from (69, 111) to (186, 192) then Places a green circle of radius 55 at center (260, 122) then Renders a green box of size 43x47 starting at (329, 43).
; PLAN: r0=69(x1), r1=111(y1), r2=186(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=122(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=329(x), r11=43(y), r12=43(width), r13=47(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 111
LDI r2, 186
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 122
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 329
LDI r11, 43
LDI r12, 43
LDI r13, 47
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
