; DESCRIPTION: Composite: Places a green line segment connecting (156, 15) to (118, 207) then Sets a single magenta pixel at (209, 58) then Draws a purple rectangle at (58, 28) with width 71 and height 12.
; PLAN: r0=156(x1), r1=15(y1), r2=118(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=58(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=28(y), r12=71(width), r13=12(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 15
LDI r2, 118
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 58
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 28
LDI r12, 71
LDI r13, 12
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
