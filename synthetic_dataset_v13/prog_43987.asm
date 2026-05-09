; DESCRIPTION: Renders a cyan disk with center (433, 133) and radius 56.
; PLAN: r0=433(x), r1=133(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 133
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
