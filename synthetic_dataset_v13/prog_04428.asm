; DESCRIPTION: Renders a white disk with center (295, 127) and radius 64.
; PLAN: r0=295(x), r1=127(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 127
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
