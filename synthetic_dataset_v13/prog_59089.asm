; DESCRIPTION: Renders a black disk with center (470, 171) and radius 27.
; PLAN: r0=470(x), r1=171(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 171
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
