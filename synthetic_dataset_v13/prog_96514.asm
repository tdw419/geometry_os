; DESCRIPTION: Places a green circle of radius 77 at center (142, 143).
; PLAN: r0=142(x), r1=143(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 143
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
