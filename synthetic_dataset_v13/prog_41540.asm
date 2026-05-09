; DESCRIPTION: Composite: Places a yellow dot at position (71, 227) then Renders a black disk with center (353, 111) and radius 70 then Places a blue line segment connecting (120, 101) to (468, 48).
; PLAN: r0=71(x), r1=227(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=111(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x1), r11=101(y1), r12=468(x2), r13=48(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 227
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 353
LDI r6, 111
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 101
LDI r12, 468
LDI r13, 48
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
