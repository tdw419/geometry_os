; DESCRIPTION: Composite: Renders a cyan disk with center (331, 40) and radius 29 then Places a blue line segment connecting (127, 27) to (269, 217) then Draws a yellow rectangle at (135, 82) with width 60 and height 89.
; PLAN: r0=331(x), r1=40(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=27(y1), r7=269(x2), r8=217(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=135(x), r11=82(y), r12=60(width), r13=89(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 40
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 27
LDI r7, 269
LDI r8, 217
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 82
LDI r12, 60
LDI r13, 89
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
