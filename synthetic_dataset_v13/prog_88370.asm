; DESCRIPTION: Places a red circle of radius 24 at center (69, 85).
; PLAN: r0=69(x), r1=85(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 85
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
