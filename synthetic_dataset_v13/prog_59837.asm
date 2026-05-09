; DESCRIPTION: Composite: Sets a single blue pixel at (63, 124) then Renders a purple disk with center (328, 78) and radius 65 then Places a blue line segment connecting (302, 249) to (488, 198).
; PLAN: r0=63(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=78(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=302(x1), r11=249(y1), r12=488(x2), r13=198(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 78
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 302
LDI r11, 249
LDI r12, 488
LDI r13, 198
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
