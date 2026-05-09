; DESCRIPTION: Composite: Places a purple dot at position (369, 162) then Renders a purple disk with center (67, 204) and radius 40 then Renders a green line between points (175, 23) and (308, 87).
; PLAN: r0=369(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=204(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=23(y1), r12=308(x2), r13=87(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 204
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 23
LDI r12, 308
LDI r13, 87
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
