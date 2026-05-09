; DESCRIPTION: Composite: Draws a red line from (131, 67) to (169, 234) then Draws a blue circle centered at (184, 141) with radius 55.
; PLAN: r0=131(x1), r1=67(y1), r2=169(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=141(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 67
LDI r2, 169
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 141
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
