; DESCRIPTION: Places a red circle of radius 64 at center (149, 132).
; PLAN: r0=149(x), r1=132(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 132
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
