; DESCRIPTION: Places a yellow circle of radius 33 at center (44, 166).
; PLAN: r0=44(x), r1=166(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 166
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
