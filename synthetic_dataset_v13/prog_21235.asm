; DESCRIPTION: Places a red circle of radius 63 at center (185, 102).
; PLAN: r0=185(x), r1=102(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 102
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
