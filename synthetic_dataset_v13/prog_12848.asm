; DESCRIPTION: Composite: Places a red 80x66 rectangle at position (214, 23) then Sets a single white pixel at (251, 135) then Draws a purple circle centered at (74, 69) with radius 36.
; PLAN: r0=214(x), r1=23(y), r2=80(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=135(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=69(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 23
LDI r2, 80
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 135
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 74
LDI r11, 69
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
