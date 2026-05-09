; DESCRIPTION: Composite: Creates a orange rectangular region at (307, 0) spanning 80 by 81 pixels then Sets a single magenta pixel at (36, 85) then Places a magenta line segment connecting (136, 21) to (215, 211).
; PLAN: r0=307(x), r1=0(y), r2=80(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=85(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=136(x1), r11=21(y1), r12=215(x2), r13=211(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 0
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 85
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 136
LDI r11, 21
LDI r12, 215
LDI r13, 211
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
