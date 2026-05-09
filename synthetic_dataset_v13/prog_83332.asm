; DESCRIPTION: Draws a yellow circle centered at (420, 104) with radius 53.
; PLAN: r0=420(x), r1=104(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 104
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
