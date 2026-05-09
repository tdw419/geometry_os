; DESCRIPTION: Draws a blue circle centered at (126, 77) with radius 59.
; PLAN: r0=126(x), r1=77(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 77
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
