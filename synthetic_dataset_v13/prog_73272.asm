; DESCRIPTION: Places a cyan circle of radius 49 at center (162, 184).
; PLAN: r0=162(x), r1=184(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 184
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
