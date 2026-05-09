; DESCRIPTION: Composite: Renders a green box of size 23x116 starting at (268, 45) then Sets a single red pixel at (179, 73) then Renders a magenta line between points (113, 104) and (503, 157).
; PLAN: r0=268(x), r1=45(y), r2=23(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=73(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=113(x1), r11=104(y1), r12=503(x2), r13=157(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 45
LDI r2, 23
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 73
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 113
LDI r11, 104
LDI r12, 503
LDI r13, 157
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
