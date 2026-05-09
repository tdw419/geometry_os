; DESCRIPTION: Renders a cyan disk with center (336, 133) and radius 65.
; PLAN: r0=336(x), r1=133(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 133
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
