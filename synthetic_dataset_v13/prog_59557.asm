; DESCRIPTION: Composite: Places a green line segment connecting (164, 239) to (309, 81) then Sets a single green pixel at (8, 8) then Places a black 57x79 rectangle at position (249, 123).
; PLAN: r0=164(x1), r1=239(y1), r2=309(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=8(x), r6=8(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=123(y), r12=57(width), r13=79(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 239
LDI r2, 309
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 8
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 249
LDI r11, 123
LDI r12, 57
LDI r13, 79
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
