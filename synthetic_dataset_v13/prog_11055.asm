; DESCRIPTION: Renders a orange disk with center (236, 163) and radius 28.
; PLAN: r0=236(x), r1=163(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 163
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
