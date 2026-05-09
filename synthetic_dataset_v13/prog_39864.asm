; DESCRIPTION: Creates a orange circular shape at (168, 70) with radius 20.
; PLAN: r0=168(x), r1=70(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 70
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
