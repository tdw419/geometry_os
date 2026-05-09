; DESCRIPTION: Renders a orange disk with center (445, 157) and radius 18.
; PLAN: r0=445(x), r1=157(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 157
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
