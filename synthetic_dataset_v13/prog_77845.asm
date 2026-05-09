; DESCRIPTION: Places a red circle of radius 74 at center (193, 162).
; PLAN: r0=193(x), r1=162(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 162
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
