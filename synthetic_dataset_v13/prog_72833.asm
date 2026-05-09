; DESCRIPTION: Draws a red circle centered at (313, 137) with radius 17.
; PLAN: r0=313(x), r1=137(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 137
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
