; DESCRIPTION: Composite: Places a purple line segment connecting (115, 116) to (233, 89) then Sets a single magenta pixel at (464, 130) then Places a red 37x24 rectangle at position (266, 167).
; PLAN: r0=115(x1), r1=116(y1), r2=233(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=130(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=167(y), r12=37(width), r13=24(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 116
LDI r2, 233
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 130
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 167
LDI r12, 37
LDI r13, 24
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
