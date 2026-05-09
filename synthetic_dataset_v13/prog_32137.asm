; DESCRIPTION: Composite: Renders a orange box of size 112x73 starting at (251, 135) then Places a magenta dot at position (217, 237) then Draws a black line from (432, 32) to (176, 88).
; PLAN: r0=251(x), r1=135(y), r2=112(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=237(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=432(x1), r11=32(y1), r12=176(x2), r13=88(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 135
LDI r2, 112
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 237
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 432
LDI r11, 32
LDI r12, 176
LDI r13, 88
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
