; DESCRIPTION: Renders a cyan disk with center (447, 115) and radius 40.
; PLAN: r0=447(x), r1=115(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 115
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
