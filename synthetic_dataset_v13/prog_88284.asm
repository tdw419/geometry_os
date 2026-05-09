; DESCRIPTION: Composite: Renders a purple disk with center (68, 197) and radius 43 then Places a green line segment connecting (436, 181) to (338, 6).
; PLAN: r0=68(x), r1=197(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x1), r6=181(y1), r7=338(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 197
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 181
LDI r7, 338
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
