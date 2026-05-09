; DESCRIPTION: Composite: Renders a black line between points (22, 29) and (112, 27) then Places a purple circle of radius 56 at center (225, 186).
; PLAN: r0=22(x1), r1=29(y1), r2=112(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=186(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 29
LDI r2, 112
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 186
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
