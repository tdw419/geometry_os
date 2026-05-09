; DESCRIPTION: Places a green circle of radius 71 at center (378, 103).
; PLAN: r0=378(x), r1=103(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 103
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
