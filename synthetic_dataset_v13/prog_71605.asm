; DESCRIPTION: Composite: Renders a blue disk with center (275, 147) and radius 79 then Renders a yellow box of size 39x70 starting at (443, 92) then Places a yellow line segment connecting (37, 175) to (80, 127).
; PLAN: r0=275(x), r1=147(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=92(y), r7=39(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x1), r11=175(y1), r12=80(x2), r13=127(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 147
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 92
LDI r7, 39
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 175
LDI r12, 80
LDI r13, 127
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
