; DESCRIPTION: Renders a black disk with center (180, 104) and radius 16.
; PLAN: r0=180(x), r1=104(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 104
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
