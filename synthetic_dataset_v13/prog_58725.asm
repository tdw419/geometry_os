; DESCRIPTION: Places a yellow circle of radius 73 at center (260, 179).
; PLAN: r0=260(x), r1=179(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 179
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
