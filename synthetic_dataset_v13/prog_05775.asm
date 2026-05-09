; DESCRIPTION: Composite: Places a green line segment connecting (136, 16) to (503, 132) then Sets a single white pixel at (22, 32) then Draws a red rectangle at (293, 53) with width 55 and height 107.
; PLAN: r0=136(x1), r1=16(y1), r2=503(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=32(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=293(x), r11=53(y), r12=55(width), r13=107(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 16
LDI r2, 503
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 32
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 293
LDI r11, 53
LDI r12, 55
LDI r13, 107
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
