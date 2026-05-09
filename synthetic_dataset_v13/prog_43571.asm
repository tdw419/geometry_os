; DESCRIPTION: Renders a cyan disk with center (287, 120) and radius 79.
; PLAN: r0=287(x), r1=120(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 120
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
