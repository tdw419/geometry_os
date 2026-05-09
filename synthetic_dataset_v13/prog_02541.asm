; DESCRIPTION: Places a red circle of radius 39 at center (363, 162).
; PLAN: r0=363(x), r1=162(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 162
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
