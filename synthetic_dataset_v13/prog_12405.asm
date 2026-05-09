; DESCRIPTION: Places a red circle of radius 55 at center (97, 162).
; PLAN: r0=97(x), r1=162(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 162
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
