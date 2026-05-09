; DESCRIPTION: Composite: Renders a purple disk with center (184, 208) and radius 38 then Places a yellow line segment connecting (263, 163) to (51, 241).
; PLAN: r0=184(x), r1=208(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=163(y1), r7=51(x2), r8=241(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 208
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 163
LDI r7, 51
LDI r8, 241
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
