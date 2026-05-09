; DESCRIPTION: Places a red circle of radius 48 at center (399, 132).
; PLAN: r0=399(x), r1=132(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 132
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
