; DESCRIPTION: Composite: Sets a single black pixel at (296, 202) then Renders a blue disk with center (408, 123) and radius 48 then Places a blue line segment connecting (481, 112) to (422, 49).
; PLAN: r0=296(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=123(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x1), r11=112(y1), r12=422(x2), r13=49(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 202
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 408
LDI r6, 123
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 112
LDI r12, 422
LDI r13, 49
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
