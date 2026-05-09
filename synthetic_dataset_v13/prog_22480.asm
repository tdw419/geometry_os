; DESCRIPTION: Renders a orange disk with center (94, 98) and radius 61.
; PLAN: r0=94(x), r1=98(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 98
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
