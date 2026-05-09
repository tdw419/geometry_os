; DESCRIPTION: Composite: Places a purple dot at position (260, 169) then Draws a cyan circle centered at (344, 141) with radius 60 then Places a purple line segment connecting (111, 18) to (92, 237).
; PLAN: r0=260(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=141(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x1), r11=18(y1), r12=92(x2), r13=237(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 141
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 18
LDI r12, 92
LDI r13, 237
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
