; DESCRIPTION: Composite: Renders a green line between points (195, 158) and (432, 30) then Sets a single blue pixel at (239, 173) then Places a cyan 79x109 rectangle at position (58, 127).
; PLAN: r0=195(x1), r1=158(y1), r2=432(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=173(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=127(y), r12=79(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 158
LDI r2, 432
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 173
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 127
LDI r12, 79
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
