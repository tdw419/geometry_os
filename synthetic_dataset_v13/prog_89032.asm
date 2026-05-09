; DESCRIPTION: Renders a cyan disk with center (209, 85) and radius 36.
; PLAN: r0=209(x), r1=85(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 85
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
