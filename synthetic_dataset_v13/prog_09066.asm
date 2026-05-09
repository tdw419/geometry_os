; DESCRIPTION: Renders a green disk with center (104, 152) and radius 72.
; PLAN: r0=104(x), r1=152(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 152
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
