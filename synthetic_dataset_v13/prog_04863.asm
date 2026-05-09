; DESCRIPTION: Composite: Draws a black line from (45, 174) to (165, 11) then Places a magenta dot at position (289, 249) then Renders a white box of size 60x18 starting at (402, 147).
; PLAN: r0=45(x1), r1=174(y1), r2=165(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=249(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=402(x), r11=147(y), r12=60(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 174
LDI r2, 165
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 249
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 402
LDI r11, 147
LDI r12, 60
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
