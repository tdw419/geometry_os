; DESCRIPTION: Places a green circle of radius 71 at center (342, 162).
; PLAN: r0=342(x), r1=162(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 162
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
