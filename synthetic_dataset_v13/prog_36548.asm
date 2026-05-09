; DESCRIPTION: Composite: Renders a black line between points (477, 68) and (10, 172) then Places a blue circle of radius 59 at center (390, 146).
; PLAN: r0=477(x1), r1=68(y1), r2=10(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=146(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 68
LDI r2, 10
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 146
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
