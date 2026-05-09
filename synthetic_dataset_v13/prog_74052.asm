; DESCRIPTION: Composite: Draws a yellow line from (421, 251) to (384, 107) then Places a black dot at position (430, 189) then Renders a magenta box of size 109x23 starting at (392, 205).
; PLAN: r0=421(x1), r1=251(y1), r2=384(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=189(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=392(x), r11=205(y), r12=109(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 251
LDI r2, 384
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 189
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 392
LDI r11, 205
LDI r12, 109
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
