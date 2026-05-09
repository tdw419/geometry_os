; DESCRIPTION: Places a purple circle of radius 68 at center (425, 188).
; PLAN: r0=425(x), r1=188(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 188
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
