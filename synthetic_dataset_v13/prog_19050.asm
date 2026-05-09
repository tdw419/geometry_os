; DESCRIPTION: Draws a yellow circle centered at (39, 95) with radius 32.
; PLAN: r0=39(x), r1=95(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 95
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
