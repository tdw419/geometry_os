; DESCRIPTION: Composite: Renders a cyan disk with center (249, 149) and radius 70 then Renders a yellow line between points (127, 141) and (137, 161) then Draws a green rectangle at (436, 125) with width 62 and height 36.
; PLAN: r0=249(x), r1=149(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=141(y1), r7=137(x2), r8=161(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=125(y), r12=62(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 149
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 141
LDI r7, 137
LDI r8, 161
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 125
LDI r12, 62
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
