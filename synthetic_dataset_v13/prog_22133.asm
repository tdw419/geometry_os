; DESCRIPTION: Renders a white disk with center (280, 187) and radius 58.
; PLAN: r0=280(x), r1=187(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 187
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
