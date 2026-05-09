; DESCRIPTION: Renders a orange disk with center (405, 164) and radius 72.
; PLAN: r0=405(x), r1=164(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 164
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
