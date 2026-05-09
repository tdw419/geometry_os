; DESCRIPTION: Composite: Places a purple 33x69 rectangle at position (352, 51) then Creates a purple circular shape at (408, 98) with radius 43 then Draws a blue line from (479, 117) to (402, 78).
; PLAN: r0=352(x), r1=51(y), r2=33(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=98(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x1), r11=117(y1), r12=402(x2), r13=78(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 51
LDI r2, 33
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 98
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 117
LDI r12, 402
LDI r13, 78
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
