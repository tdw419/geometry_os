; DESCRIPTION: Composite: Sets a single white pixel at (283, 171) then Places a magenta circle of radius 54 at center (219, 189) then Draws a orange line from (181, 243) to (488, 19).
; PLAN: r0=283(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=189(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x1), r11=243(y1), r12=488(x2), r13=19(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 189
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 243
LDI r12, 488
LDI r13, 19
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
