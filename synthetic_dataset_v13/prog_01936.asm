; DESCRIPTION: Renders a white disk with center (330, 91) and radius 57.
; PLAN: r0=330(x), r1=91(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 91
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
