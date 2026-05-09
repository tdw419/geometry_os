; DESCRIPTION: Composite: Renders a purple disk with center (58, 76) and radius 13 then Renders a blue line between points (330, 92) and (172, 223).
; PLAN: r0=58(x), r1=76(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x1), r6=92(y1), r7=172(x2), r8=223(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 76
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 92
LDI r7, 172
LDI r8, 223
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
