; DESCRIPTION: Composite: Places a white dot at position (279, 250) then Renders a black disk with center (149, 158) and radius 47 then Places a black line segment connecting (307, 41) to (54, 62).
; PLAN: r0=279(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=158(y), r7=47(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x1), r11=41(y1), r12=54(x2), r13=62(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 158
LDI r7, 47
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 41
LDI r12, 54
LDI r13, 62
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
