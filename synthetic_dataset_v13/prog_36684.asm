; DESCRIPTION: Composite: Draws a green rectangle at (240, 107) with width 97 and height 85 then Places a blue line segment connecting (184, 213) to (328, 161) then Renders a yellow disk with center (217, 77) and radius 35.
; PLAN: r0=240(x), r1=107(y), r2=97(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=213(y1), r7=328(x2), r8=161(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=217(x), r11=77(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 107
LDI r2, 97
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 213
LDI r7, 328
LDI r8, 161
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 77
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
