; DESCRIPTION: Renders a cyan disk with center (472, 44) and radius 36.
; PLAN: r0=472(x), r1=44(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 44
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
