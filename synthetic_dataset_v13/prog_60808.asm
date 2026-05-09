; DESCRIPTION: Renders a orange disk with center (157, 39) and radius 27.
; PLAN: r0=157(x), r1=39(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 39
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
