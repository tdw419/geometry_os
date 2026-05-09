; DESCRIPTION: Places a red circle of radius 23 at center (248, 219).
; PLAN: r0=248(x), r1=219(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 219
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
