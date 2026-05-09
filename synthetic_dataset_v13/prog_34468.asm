; DESCRIPTION: Renders a cyan disk with center (25, 137) and radius 12.
; PLAN: r0=25(x), r1=137(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 137
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
