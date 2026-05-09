; DESCRIPTION: Renders a orange disk with center (322, 93) and radius 67.
; PLAN: r0=322(x), r1=93(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 93
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
