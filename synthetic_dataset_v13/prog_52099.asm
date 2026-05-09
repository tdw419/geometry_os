; DESCRIPTION: Places a red circle of radius 77 at center (416, 131).
; PLAN: r0=416(x), r1=131(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 131
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
