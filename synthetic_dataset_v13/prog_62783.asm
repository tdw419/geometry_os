; DESCRIPTION: Composite: Places a black line segment connecting (106, 18) to (441, 96) then Places a magenta dot at position (293, 247) then Draws a purple rectangle at (385, 230) with width 67 and height 11.
; PLAN: r0=106(x1), r1=18(y1), r2=441(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=230(y), r12=67(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 18
LDI r2, 441
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 230
LDI r12, 67
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
