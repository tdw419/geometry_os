; DESCRIPTION: Places a red circle of radius 69 at center (174, 106).
; PLAN: r0=174(x), r1=106(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 106
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
