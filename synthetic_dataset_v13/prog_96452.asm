; DESCRIPTION: Renders a orange disk with center (360, 82) and radius 57.
; PLAN: r0=360(x), r1=82(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 82
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
