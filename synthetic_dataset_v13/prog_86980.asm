; DESCRIPTION: Renders a cyan disk with center (355, 52) and radius 43.
; PLAN: r0=355(x), r1=52(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 52
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
