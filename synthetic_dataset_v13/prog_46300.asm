; DESCRIPTION: Places a red circle of radius 25 at center (438, 189).
; PLAN: r0=438(x), r1=189(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 189
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
