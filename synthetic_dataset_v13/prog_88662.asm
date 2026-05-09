; DESCRIPTION: Places a red circle of radius 29 at center (465, 123).
; PLAN: r0=465(x), r1=123(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 123
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
