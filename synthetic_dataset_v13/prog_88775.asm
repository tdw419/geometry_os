; DESCRIPTION: Renders a cyan disk with center (411, 170) and radius 77.
; PLAN: r0=411(x), r1=170(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 170
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
