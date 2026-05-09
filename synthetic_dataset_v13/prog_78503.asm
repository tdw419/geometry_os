; DESCRIPTION: Places a red circle of radius 80 at center (309, 162).
; PLAN: r0=309(x), r1=162(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 162
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
