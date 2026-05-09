; DESCRIPTION: Composite: Draws a purple circle centered at (52, 98) with radius 22 then Sets a single white pixel at (167, 255) then Places a green line segment connecting (196, 14) to (234, 81).
; PLAN: r0=52(x), r1=98(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=196(x1), r11=14(y1), r12=234(x2), r13=81(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 98
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 196
LDI r11, 14
LDI r12, 234
LDI r13, 81
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
