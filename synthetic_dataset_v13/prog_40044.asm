; DESCRIPTION: Composite: Renders a black disk with center (288, 74) and radius 29 then Places a purple line segment connecting (480, 163) to (166, 86).
; PLAN: r0=288(x), r1=74(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x1), r6=163(y1), r7=166(x2), r8=86(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 74
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 163
LDI r7, 166
LDI r8, 86
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
