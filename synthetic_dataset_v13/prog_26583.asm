; DESCRIPTION: Places a red circle of radius 26 at center (143, 136).
; PLAN: r0=143(x), r1=136(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 136
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
