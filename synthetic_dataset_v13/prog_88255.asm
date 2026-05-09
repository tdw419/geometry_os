; DESCRIPTION: Renders a cyan disk with center (424, 84) and radius 77.
; PLAN: r0=424(x), r1=84(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 84
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
