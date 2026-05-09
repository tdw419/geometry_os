; DESCRIPTION: Draws a yellow circle centered at (173, 84) with radius 51.
; PLAN: r0=173(x), r1=84(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 84
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
