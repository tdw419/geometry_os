; DESCRIPTION: Renders a orange disk with center (368, 65) and radius 57.
; PLAN: r0=368(x), r1=65(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 65
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
