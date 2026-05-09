; DESCRIPTION: Draws a black circle centered at (202, 83) with radius 54.
; PLAN: r0=202(x), r1=83(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 83
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
