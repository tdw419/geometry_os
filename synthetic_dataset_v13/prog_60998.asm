; DESCRIPTION: Places a red circle of radius 10 at center (448, 83).
; PLAN: r0=448(x), r1=83(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 83
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
