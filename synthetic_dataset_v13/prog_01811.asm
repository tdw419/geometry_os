; DESCRIPTION: Renders a cyan disk with center (152, 84) and radius 45.
; PLAN: r0=152(x), r1=84(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 84
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
