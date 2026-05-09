; DESCRIPTION: Renders a cyan disk with center (270, 199) and radius 50.
; PLAN: r0=270(x), r1=199(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 199
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
