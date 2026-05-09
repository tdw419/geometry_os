; DESCRIPTION: Renders a cyan disk with center (264, 233) and radius 11.
; PLAN: r0=264(x), r1=233(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 233
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
