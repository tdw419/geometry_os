; DESCRIPTION: Composite: Sets a single red pixel at (69, 130) then Draws a purple circle centered at (175, 73) with radius 49 then Places a cyan line segment connecting (53, 63) to (3, 159).
; PLAN: r0=69(x), r1=130(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=73(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x1), r11=63(y1), r12=3(x2), r13=159(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 130
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 175
LDI r6, 73
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 63
LDI r12, 3
LDI r13, 159
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
