; DESCRIPTION: Composite: Renders a purple box of size 63x112 starting at (115, 50) then Places a magenta dot at position (237, 19) then Renders a black line between points (438, 173) and (0, 20).
; PLAN: r0=115(x), r1=50(y), r2=63(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=19(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=438(x1), r11=173(y1), r12=0(x2), r13=20(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 50
LDI r2, 63
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 19
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 173
LDI r12, 0
LDI r13, 20
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
