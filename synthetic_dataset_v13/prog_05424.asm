; DESCRIPTION: Composite: Renders a black disk with center (288, 66) and radius 64 then Renders a blue line between points (39, 72) and (69, 148).
; PLAN: r0=288(x), r1=66(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x1), r6=72(y1), r7=69(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 66
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 72
LDI r7, 69
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
