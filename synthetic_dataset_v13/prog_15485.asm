; DESCRIPTION: Places a green circle of radius 38 at center (231, 179).
; PLAN: r0=231(x), r1=179(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 179
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
