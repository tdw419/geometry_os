; DESCRIPTION: Renders a cyan disk with center (87, 172) and radius 70.
; PLAN: r0=87(x), r1=172(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 172
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
