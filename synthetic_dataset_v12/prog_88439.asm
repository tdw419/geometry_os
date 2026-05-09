; DESCRIPTION: Composite: Renders a blue line between points (476, 217) and (217, 247) then Sets a single magenta pixel at (210, 94) then Draws a purple rectangle at (228, 5) with width 81 and height 10.
; PLAN: r0=476(x1), r1=217(y1), r2=217(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=94(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=228(x), r11=5(y), r12=81(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 217
LDI r2, 217
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 94
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 228
LDI r11, 5
LDI r12, 81
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
