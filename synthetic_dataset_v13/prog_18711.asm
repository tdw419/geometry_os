; DESCRIPTION: Renders a orange disk with center (98, 228) and radius 14.
; PLAN: r0=98(x), r1=228(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 228
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
