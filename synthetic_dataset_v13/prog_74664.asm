; DESCRIPTION: Renders a cyan disk with center (371, 200) and radius 48.
; PLAN: r0=371(x), r1=200(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 200
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
