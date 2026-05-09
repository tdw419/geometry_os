; DESCRIPTION: Renders a cyan disk with center (429, 106) and radius 66.
; PLAN: r0=429(x), r1=106(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 106
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
