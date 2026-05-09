; DESCRIPTION: Composite: Sets a single cyan pixel at (82, 121) then Draws a purple circle centered at (276, 100) with radius 73 then Places a blue line segment connecting (440, 184) to (233, 132).
; PLAN: r0=82(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=100(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x1), r11=184(y1), r12=233(x2), r13=132(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 276
LDI r6, 100
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 184
LDI r12, 233
LDI r13, 132
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
