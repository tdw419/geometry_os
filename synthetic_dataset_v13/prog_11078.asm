; DESCRIPTION: Renders a cyan disk with center (463, 133) and radius 47.
; PLAN: r0=463(x), r1=133(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 133
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
