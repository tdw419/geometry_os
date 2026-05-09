; DESCRIPTION: Draws a orange circle centered at (199, 93) with radius 59.
; PLAN: r0=199(x), r1=93(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 93
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
