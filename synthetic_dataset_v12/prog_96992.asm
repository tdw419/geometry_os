; DESCRIPTION: Places a red circle of radius 38 at center (466, 196).
; PLAN: r0=466(x), r1=196(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 196
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
