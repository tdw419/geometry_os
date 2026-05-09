; DESCRIPTION: Places a cyan circle of radius 43 at center (188, 72).
; PLAN: r0=188(x), r1=72(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 72
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
