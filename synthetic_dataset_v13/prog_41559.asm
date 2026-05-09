; DESCRIPTION: Composite: Renders a yellow box of size 117x111 starting at (204, 85) then Places a red line segment connecting (215, 138) to (222, 232).
; PLAN: r0=204(x), r1=85(y), r2=117(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x1), r6=138(y1), r7=222(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 85
LDI r2, 117
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 138
LDI r7, 222
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
