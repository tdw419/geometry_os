; DESCRIPTION: Composite: Creates a red rectangular region at (361, 128) spanning 103 by 111 pixels then Sets a single black pixel at (417, 62) then Places a blue line segment connecting (333, 123) to (427, 180).
; PLAN: r0=361(x), r1=128(y), r2=103(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=62(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=333(x1), r11=123(y1), r12=427(x2), r13=180(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 128
LDI r2, 103
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 62
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 333
LDI r11, 123
LDI r12, 427
LDI r13, 180
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
