; DESCRIPTION: Places a red circle of radius 10 at center (218, 45).
; PLAN: r0=218(x), r1=45(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 45
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
