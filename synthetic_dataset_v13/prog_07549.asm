; DESCRIPTION: Composite: Renders a magenta line between points (17, 21) and (456, 227) then Sets a single magenta pixel at (206, 75) then Renders a blue box of size 36x63 starting at (285, 59).
; PLAN: r0=17(x1), r1=21(y1), r2=456(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=75(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=285(x), r11=59(y), r12=36(width), r13=63(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 21
LDI r2, 456
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 75
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 285
LDI r11, 59
LDI r12, 36
LDI r13, 63
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
