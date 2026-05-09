; DESCRIPTION: Composite: Places a purple line segment connecting (231, 171) to (337, 58) then Sets a single magenta pixel at (126, 112) then Places a black 40x41 rectangle at position (263, 0).
; PLAN: r0=231(x1), r1=171(y1), r2=337(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=112(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=0(y), r12=40(width), r13=41(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 171
LDI r2, 337
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 112
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 263
LDI r11, 0
LDI r12, 40
LDI r13, 41
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
