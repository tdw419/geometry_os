; DESCRIPTION: Draws a yellow circle centered at (439, 60) with radius 40.
; PLAN: r0=439(x), r1=60(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 60
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
