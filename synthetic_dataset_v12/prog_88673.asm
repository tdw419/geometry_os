; DESCRIPTION: Composite: Renders a magenta disk with center (273, 138) and radius 67 then Renders a blue line between points (472, 107) and (287, 98).
; PLAN: r0=273(x), r1=138(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=107(y1), r7=287(x2), r8=98(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 138
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 107
LDI r7, 287
LDI r8, 98
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
