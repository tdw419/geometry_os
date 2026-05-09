; DESCRIPTION: Draws a yellow circle centered at (255, 163) with radius 79.
; PLAN: r0=255(x), r1=163(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 163
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
