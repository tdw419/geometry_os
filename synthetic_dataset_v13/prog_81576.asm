; DESCRIPTION: Composite: Places a black dot at position (56, 211) then Places a magenta line segment connecting (239, 74) to (389, 112) then Places a purple 30x107 rectangle at position (312, 144).
; PLAN: r0=56(x), r1=211(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=239(x1), r6=74(y1), r7=389(x2), r8=112(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=144(y), r12=30(width), r13=107(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 211
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 239
LDI r6, 74
LDI r7, 389
LDI r8, 112
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 144
LDI r12, 30
LDI r13, 107
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
