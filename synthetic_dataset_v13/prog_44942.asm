; DESCRIPTION: Composite: Draws a magenta line from (32, 229) to (429, 207) then Sets a single green pixel at (181, 121) then Renders a yellow box of size 83x92 starting at (325, 48).
; PLAN: r0=32(x1), r1=229(y1), r2=429(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=121(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=325(x), r11=48(y), r12=83(width), r13=92(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 229
LDI r2, 429
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 121
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 325
LDI r11, 48
LDI r12, 83
LDI r13, 92
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
