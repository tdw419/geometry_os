; DESCRIPTION: Places a white circle of radius 58 at center (231, 193).
; PLAN: r0=231(x), r1=193(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 193
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
