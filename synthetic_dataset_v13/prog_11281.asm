; DESCRIPTION: Places a red circle of radius 22 at center (177, 196).
; PLAN: r0=177(x), r1=196(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 196
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
