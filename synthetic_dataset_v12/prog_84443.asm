; DESCRIPTION: Composite: Renders a black line between points (67, 102) and (506, 197) then Sets a single green pixel at (351, 5) then Renders a magenta box of size 17x72 starting at (61, 0).
; PLAN: r0=67(x1), r1=102(y1), r2=506(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=5(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=61(x), r11=0(y), r12=17(width), r13=72(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 102
LDI r2, 506
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 5
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 61
LDI r11, 0
LDI r12, 17
LDI r13, 72
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
