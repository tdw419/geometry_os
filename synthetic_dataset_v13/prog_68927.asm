; DESCRIPTION: Places a red circle of radius 13 at center (94, 218).
; PLAN: r0=94(x), r1=218(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 218
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
