; DESCRIPTION: Places a cyan circle of radius 35 at center (452, 36).
; PLAN: r0=452(x), r1=36(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 36
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
