; DESCRIPTION: Composite: Draws a magenta circle centered at (121, 113) with radius 39 then Places a blue dot at position (472, 73) then Draws a orange line from (455, 207) to (373, 180).
; PLAN: r0=121(x), r1=113(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=455(x1), r11=207(y1), r12=373(x2), r13=180(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 113
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 455
LDI r11, 207
LDI r12, 373
LDI r13, 180
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
