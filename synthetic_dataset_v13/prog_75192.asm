; DESCRIPTION: Draws a yellow circle centered at (300, 95) with radius 21.
; PLAN: r0=300(x), r1=95(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 95
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
