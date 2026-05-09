; DESCRIPTION: Renders a orange disk with center (86, 168) and radius 28.
; PLAN: r0=86(x), r1=168(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 168
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
