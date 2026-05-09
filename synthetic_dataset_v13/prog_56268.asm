; DESCRIPTION: Renders a white disk with center (173, 91) and radius 65.
; PLAN: r0=173(x), r1=91(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 91
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
