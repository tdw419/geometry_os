; DESCRIPTION: Places a black circle of radius 56 at center (445, 153).
; PLAN: r0=445(x), r1=153(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 153
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
