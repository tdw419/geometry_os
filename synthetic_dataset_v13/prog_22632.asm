; DESCRIPTION: Composite: Sets a single magenta pixel at (64, 55) then Renders a orange line between points (235, 155) and (455, 54) then Renders a black box of size 81x35 starting at (69, 210).
; PLAN: r0=64(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=155(y1), r7=455(x2), r8=54(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=210(y), r12=81(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 155
LDI r7, 455
LDI r8, 54
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 210
LDI r12, 81
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
