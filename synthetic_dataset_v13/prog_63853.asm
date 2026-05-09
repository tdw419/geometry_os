; DESCRIPTION: Places a yellow circle of radius 31 at center (101, 173).
; PLAN: r0=101(x), r1=173(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 173
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
