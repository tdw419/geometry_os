; DESCRIPTION: Places a red circle of radius 50 at center (102, 87).
; PLAN: r0=102(x), r1=87(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 87
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
