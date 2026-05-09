; DESCRIPTION: Draws a orange circle centered at (305, 58) with radius 21.
; PLAN: r0=305(x), r1=58(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 58
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
