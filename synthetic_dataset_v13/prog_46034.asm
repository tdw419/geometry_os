; DESCRIPTION: Composite: Places a magenta circle of radius 59 at center (246, 181) then Places a yellow dot at position (193, 238) then Places a yellow line segment connecting (314, 116) to (472, 42).
; PLAN: r0=246(x), r1=181(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=314(x1), r11=116(y1), r12=472(x2), r13=42(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 181
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 314
LDI r11, 116
LDI r12, 472
LDI r13, 42
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
