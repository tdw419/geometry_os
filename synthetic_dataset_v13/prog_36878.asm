; DESCRIPTION: Renders a cyan disk with center (231, 148) and radius 77.
; PLAN: r0=231(x), r1=148(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 148
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
