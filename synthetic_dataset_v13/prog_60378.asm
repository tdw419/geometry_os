; DESCRIPTION: Places a black circle of radius 64 at center (187, 120).
; PLAN: r0=187(x), r1=120(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 120
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
