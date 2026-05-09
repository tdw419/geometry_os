; DESCRIPTION: Renders a orange disk with center (294, 138) and radius 65.
; PLAN: r0=294(x), r1=138(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 138
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
