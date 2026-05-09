; DESCRIPTION: Renders a orange disk with center (215, 151) and radius 63.
; PLAN: r0=215(x), r1=151(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 151
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
