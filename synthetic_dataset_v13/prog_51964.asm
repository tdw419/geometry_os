; DESCRIPTION: Places a blue circle of radius 75 at center (202, 138).
; PLAN: r0=202(x), r1=138(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 138
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
