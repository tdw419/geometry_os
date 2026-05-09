; DESCRIPTION: Places a orange circle of radius 50 at center (119, 167).
; PLAN: r0=119(x), r1=167(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 167
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
