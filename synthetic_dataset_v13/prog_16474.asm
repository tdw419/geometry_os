; DESCRIPTION: Places a red circle of radius 38 at center (428, 184).
; PLAN: r0=428(x), r1=184(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 184
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
