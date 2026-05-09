; DESCRIPTION: Composite: Draws a purple rectangle at (105, 108) with width 119 and height 35 then Sets a single white pixel at (265, 14) then Draws a magenta line from (46, 32) to (111, 1).
; PLAN: r0=105(x), r1=108(y), r2=119(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=14(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=46(x1), r11=32(y1), r12=111(x2), r13=1(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 108
LDI r2, 119
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 14
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 46
LDI r11, 32
LDI r12, 111
LDI r13, 1
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
