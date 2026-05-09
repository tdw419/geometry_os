; DESCRIPTION: Draws a yellow circle centered at (344, 145) with radius 64.
; PLAN: r0=344(x), r1=145(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 145
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
