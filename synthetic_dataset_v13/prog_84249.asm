; DESCRIPTION: Composite: Renders a yellow box of size 73x55 starting at (55, 11) then Draws a yellow line from (35, 145) to (424, 189).
; PLAN: r0=55(x), r1=11(y), r2=73(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x1), r6=145(y1), r7=424(x2), r8=189(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 11
LDI r2, 73
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 145
LDI r7, 424
LDI r8, 189
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
