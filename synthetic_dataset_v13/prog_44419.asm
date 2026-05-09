; DESCRIPTION: Renders a white disk with center (215, 127) and radius 14.
; PLAN: r0=215(x), r1=127(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 127
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
