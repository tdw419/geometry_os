; DESCRIPTION: Renders a orange disk with center (183, 166) and radius 57.
; PLAN: r0=183(x), r1=166(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 166
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
