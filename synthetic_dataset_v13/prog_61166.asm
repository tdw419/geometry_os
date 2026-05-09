; DESCRIPTION: Places a red circle of radius 79 at center (134, 150).
; PLAN: r0=134(x), r1=150(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 150
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
