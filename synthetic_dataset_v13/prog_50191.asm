; DESCRIPTION: Places a red circle of radius 64 at center (80, 109).
; PLAN: r0=80(x), r1=109(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 109
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
