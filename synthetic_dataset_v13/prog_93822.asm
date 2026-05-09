; DESCRIPTION: Places a red circle of radius 61 at center (66, 132).
; PLAN: r0=66(x), r1=132(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 132
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
