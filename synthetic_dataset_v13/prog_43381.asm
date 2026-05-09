; DESCRIPTION: Draws a red circle centered at (499, 131) with radius 13.
; PLAN: r0=499(x), r1=131(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 499
LDI r1, 131
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
