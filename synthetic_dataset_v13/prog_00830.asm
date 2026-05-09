; DESCRIPTION: Creates a orange circular shape at (410, 180) with radius 62.
; PLAN: r0=410(x), r1=180(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 180
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
