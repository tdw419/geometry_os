; DESCRIPTION: Renders a orange disk with center (470, 151) and radius 21.
; PLAN: r0=470(x), r1=151(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 151
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
