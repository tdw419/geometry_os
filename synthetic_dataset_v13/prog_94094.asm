; DESCRIPTION: Places a red circle of radius 80 at center (326, 99).
; PLAN: r0=326(x), r1=99(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 99
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
