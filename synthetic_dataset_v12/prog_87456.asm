; DESCRIPTION: Composite: Draws a blue line from (30, 232) to (499, 37) then Sets a single white pixel at (215, 53) then Draws a magenta circle centered at (240, 140) with radius 32.
; PLAN: r0=30(x1), r1=232(y1), r2=499(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=53(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=140(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 232
LDI r2, 499
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 53
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 240
LDI r11, 140
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
