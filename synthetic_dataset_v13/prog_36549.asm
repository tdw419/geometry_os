; DESCRIPTION: Places a red circle of radius 75 at center (102, 150).
; PLAN: r0=102(x), r1=150(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
