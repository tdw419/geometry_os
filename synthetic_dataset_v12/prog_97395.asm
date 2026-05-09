; DESCRIPTION: Composite: Places a cyan line segment connecting (220, 131) to (16, 253) then Sets a single red pixel at (453, 63) then Draws a black rectangle at (63, 199) with width 93 and height 21.
; PLAN: r0=220(x1), r1=131(y1), r2=16(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=63(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=199(y), r12=93(width), r13=21(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 131
LDI r2, 16
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 63
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 63
LDI r11, 199
LDI r12, 93
LDI r13, 21
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
