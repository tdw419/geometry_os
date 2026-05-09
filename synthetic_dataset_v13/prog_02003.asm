; DESCRIPTION: Places a yellow circle of radius 77 at center (176, 140).
; PLAN: r0=176(x), r1=140(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 140
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
