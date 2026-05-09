; DESCRIPTION: Places a red circle of radius 30 at center (362, 59).
; PLAN: r0=362(x), r1=59(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 59
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
