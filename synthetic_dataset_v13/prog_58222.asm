; DESCRIPTION: Places a blue circle of radius 34 at center (323, 177).
; PLAN: r0=323(x), r1=177(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 177
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
