; DESCRIPTION: Composite: Renders a orange line between points (228, 38) and (382, 207) then Places a blue circle of radius 14 at center (414, 121).
; PLAN: r0=228(x1), r1=38(y1), r2=382(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=121(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 38
LDI r2, 382
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 121
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
