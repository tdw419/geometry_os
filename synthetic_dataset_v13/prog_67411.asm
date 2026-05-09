; DESCRIPTION: Places a red circle of radius 59 at center (403, 123).
; PLAN: r0=403(x), r1=123(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 123
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
