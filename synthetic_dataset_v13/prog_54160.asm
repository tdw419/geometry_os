; DESCRIPTION: Draws a orange circle centered at (305, 153) with radius 77.
; PLAN: r0=305(x), r1=153(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 153
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
