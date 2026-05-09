; DESCRIPTION: Places a cyan circle of radius 26 at center (408, 58).
; PLAN: r0=408(x), r1=58(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 58
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
