; DESCRIPTION: Composite: Renders a magenta line between points (292, 215) and (88, 157) then Draws a magenta rectangle at (383, 133) with width 93 and height 27 then Renders a black disk with center (184, 218) and radius 38.
; PLAN: r0=292(x1), r1=215(y1), r2=88(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=133(y), r7=93(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=218(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 215
LDI r2, 88
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 133
LDI r7, 93
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 218
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
