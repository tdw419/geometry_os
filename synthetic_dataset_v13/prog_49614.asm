; DESCRIPTION: Composite: Renders a yellow line between points (341, 255) and (24, 114) then Renders a blue disk with center (308, 159) and radius 59.
; PLAN: r0=341(x1), r1=255(y1), r2=24(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=159(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 255
LDI r2, 24
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 159
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
