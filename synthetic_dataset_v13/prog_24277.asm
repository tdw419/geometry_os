; DESCRIPTION: Places a red circle of radius 73 at center (209, 132).
; PLAN: r0=209(x), r1=132(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 132
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
