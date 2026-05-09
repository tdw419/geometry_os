; DESCRIPTION: Composite: Renders a blue disk with center (157, 193) and radius 48 then Places a blue line segment connecting (482, 49) to (339, 193).
; PLAN: r0=157(x), r1=193(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x1), r6=49(y1), r7=339(x2), r8=193(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 193
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 49
LDI r7, 339
LDI r8, 193
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
