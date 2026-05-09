; DESCRIPTION: Composite: Places a blue dot at position (240, 119) then Renders a white disk with center (420, 104) and radius 38 then Renders a black line between points (47, 110) and (119, 187).
; PLAN: r0=240(x), r1=119(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=104(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x1), r11=110(y1), r12=119(x2), r13=187(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 119
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 104
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 110
LDI r12, 119
LDI r13, 187
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
