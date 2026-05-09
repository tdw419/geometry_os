; DESCRIPTION: Renders a orange disk with center (180, 195) and radius 33.
; PLAN: r0=180(x), r1=195(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 195
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
