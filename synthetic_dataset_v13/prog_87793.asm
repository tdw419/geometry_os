; DESCRIPTION: Composite: Draws a yellow line from (132, 210) to (57, 250) then Draws a black circle centered at (444, 79) with radius 57 then Places a magenta 115x18 rectangle at position (82, 230).
; PLAN: r0=132(x1), r1=210(y1), r2=57(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=79(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=230(y), r12=115(width), r13=18(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 210
LDI r2, 57
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 79
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 230
LDI r12, 115
LDI r13, 18
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
