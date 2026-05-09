; DESCRIPTION: Renders a cyan disk with center (300, 81) and radius 30.
; PLAN: r0=300(x), r1=81(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 81
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
