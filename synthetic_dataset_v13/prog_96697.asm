; DESCRIPTION: Draws a orange circle centered at (269, 120) with radius 80.
; PLAN: r0=269(x), r1=120(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 120
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
