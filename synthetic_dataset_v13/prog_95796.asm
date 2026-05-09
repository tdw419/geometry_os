; DESCRIPTION: Creates a orange circular shape at (400, 145) with radius 80.
; PLAN: r0=400(x), r1=145(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 145
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
