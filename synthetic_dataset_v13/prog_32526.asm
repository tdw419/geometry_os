; DESCRIPTION: Places a red circle of radius 59 at center (96, 93).
; PLAN: r0=96(x), r1=93(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 93
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
