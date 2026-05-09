; DESCRIPTION: Places a red circle of radius 44 at center (121, 85).
; PLAN: r0=121(x), r1=85(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 85
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
