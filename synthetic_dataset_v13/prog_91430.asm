; DESCRIPTION: Draws a red circle centered at (293, 59) with radius 11.
; PLAN: r0=293(x), r1=59(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 59
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
