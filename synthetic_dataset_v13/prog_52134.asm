; DESCRIPTION: Places a cyan circle of radius 39 at center (133, 188).
; PLAN: r0=133(x), r1=188(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 188
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
