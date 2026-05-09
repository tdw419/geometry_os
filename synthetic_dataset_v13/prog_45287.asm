; DESCRIPTION: Places a red circle of radius 60 at center (181, 90).
; PLAN: r0=181(x), r1=90(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 90
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
