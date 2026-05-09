; DESCRIPTION: Renders a green disk with center (267, 152) and radius 75.
; PLAN: r0=267(x), r1=152(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 152
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
