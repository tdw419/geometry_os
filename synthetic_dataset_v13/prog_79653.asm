; DESCRIPTION: Renders a white disk with center (392, 79) and radius 21.
; PLAN: r0=392(x), r1=79(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 79
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
