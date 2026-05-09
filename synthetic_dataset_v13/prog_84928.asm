; DESCRIPTION: Composite: Places a white circle of radius 71 at center (255, 181) then Places a magenta dot at position (293, 2) then Places a orange line segment connecting (215, 147) to (238, 244).
; PLAN: r0=255(x), r1=181(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=2(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x1), r11=147(y1), r12=238(x2), r13=244(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 181
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 2
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 147
LDI r12, 238
LDI r13, 244
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
