; DESCRIPTION: Renders a cyan disk with center (133, 120) and radius 46.
; PLAN: r0=133(x), r1=120(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 120
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
