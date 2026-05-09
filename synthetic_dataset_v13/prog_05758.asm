; DESCRIPTION: Places a cyan circle of radius 37 at center (369, 218).
; PLAN: r0=369(x), r1=218(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 218
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
