; DESCRIPTION: Composite: Draws a orange rectangle at (204, 130) with width 73 and height 26 then Places a black dot at position (105, 246) then Draws a magenta line from (257, 132) to (218, 239).
; PLAN: r0=204(x), r1=130(y), r2=73(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=246(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=257(x1), r11=132(y1), r12=218(x2), r13=239(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 130
LDI r2, 73
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 246
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 257
LDI r11, 132
LDI r12, 218
LDI r13, 239
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
