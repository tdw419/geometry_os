; DESCRIPTION: Renders a cyan disk with center (211, 164) and radius 74.
; PLAN: r0=211(x), r1=164(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 164
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
