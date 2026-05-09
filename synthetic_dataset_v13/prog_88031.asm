; DESCRIPTION: Renders a cyan disk with center (55, 74) and radius 13.
; PLAN: r0=55(x), r1=74(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 74
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
