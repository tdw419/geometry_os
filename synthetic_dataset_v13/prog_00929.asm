; DESCRIPTION: Places a cyan circle of radius 15 at center (174, 115).
; PLAN: r0=174(x), r1=115(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 115
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
