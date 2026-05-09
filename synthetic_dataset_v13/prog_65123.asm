; DESCRIPTION: Places a red circle of radius 44 at center (252, 134).
; PLAN: r0=252(x), r1=134(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 134
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
