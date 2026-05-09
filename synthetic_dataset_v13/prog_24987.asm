; DESCRIPTION: Draws a red circle centered at (424, 209) with radius 44.
; PLAN: r0=424(x), r1=209(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 209
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
