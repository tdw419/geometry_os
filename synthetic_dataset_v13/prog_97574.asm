; DESCRIPTION: Places a red circle of radius 59 at center (305, 155).
; PLAN: r0=305(x), r1=155(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 155
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
