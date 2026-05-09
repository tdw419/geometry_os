; DESCRIPTION: Places a red circle of radius 73 at center (278, 160).
; PLAN: r0=278(x), r1=160(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 160
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
