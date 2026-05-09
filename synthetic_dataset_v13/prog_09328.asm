; DESCRIPTION: Composite: Renders a magenta line between points (208, 84) and (74, 87) then Sets a single yellow pixel at (234, 136) then Draws a black rectangle at (362, 103) with width 71 and height 107.
; PLAN: r0=208(x1), r1=84(y1), r2=74(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=136(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=103(y), r12=71(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 84
LDI r2, 74
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 136
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 362
LDI r11, 103
LDI r12, 71
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
