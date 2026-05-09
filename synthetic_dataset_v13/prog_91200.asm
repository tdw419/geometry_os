; DESCRIPTION: Composite: Places a blue dot at position (22, 149) then Renders a blue box of size 14x55 starting at (218, 123) then Places a yellow line segment connecting (178, 117) to (488, 147).
; PLAN: r0=22(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=123(y), r7=14(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=178(x1), r11=117(y1), r12=488(x2), r13=147(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 123
LDI r7, 14
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 117
LDI r12, 488
LDI r13, 147
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
