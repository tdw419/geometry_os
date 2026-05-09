; DESCRIPTION: Composite: Renders a black disk with center (230, 174) and radius 32 then Places a purple line segment connecting (152, 136) to (305, 114).
; PLAN: r0=230(x), r1=174(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=136(y1), r7=305(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 174
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 136
LDI r7, 305
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
