; DESCRIPTION: Composite: Places a red circle of radius 24 at center (167, 214) then Places a black dot at position (237, 122) then Draws a magenta line from (459, 17) to (308, 228).
; PLAN: r0=167(x), r1=214(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=122(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=459(x1), r11=17(y1), r12=308(x2), r13=228(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 214
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 122
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 459
LDI r11, 17
LDI r12, 308
LDI r13, 228
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
