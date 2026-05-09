; DESCRIPTION: Renders a cyan disk with center (133, 145) and radius 50.
; PLAN: r0=133(x), r1=145(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 145
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
