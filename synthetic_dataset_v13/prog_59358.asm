; DESCRIPTION: Composite: Places a blue dot at position (48, 252) then Places a blue circle of radius 44 at center (243, 182) then Renders a orange line between points (31, 145) and (200, 62).
; PLAN: r0=48(x), r1=252(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=182(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x1), r11=145(y1), r12=200(x2), r13=62(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 252
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 182
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 145
LDI r12, 200
LDI r13, 62
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
