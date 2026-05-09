; DESCRIPTION: Renders a orange disk with center (228, 141) and radius 33.
; PLAN: r0=228(x), r1=141(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 141
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
