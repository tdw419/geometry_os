; DESCRIPTION: Renders a cyan disk with center (273, 157) and radius 70.
; PLAN: r0=273(x), r1=157(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 157
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
