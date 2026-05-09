; DESCRIPTION: Composite: Draws a yellow rectangle at (176, 126) with width 74 and height 55 then Renders a red disk with center (269, 220) and radius 18 then Draws a blue line from (429, 61) to (447, 199).
; PLAN: r0=176(x), r1=126(y), r2=74(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=220(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x1), r11=61(y1), r12=447(x2), r13=199(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 126
LDI r2, 74
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 220
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 61
LDI r12, 447
LDI r13, 199
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
