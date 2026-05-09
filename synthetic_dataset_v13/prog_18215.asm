; DESCRIPTION: Renders a cyan disk with center (144, 200) and radius 22.
; PLAN: r0=144(x), r1=200(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 200
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
