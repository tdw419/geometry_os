; DESCRIPTION: Places a red circle of radius 34 at center (433, 90).
; PLAN: r0=433(x), r1=90(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 90
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
