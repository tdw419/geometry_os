; DESCRIPTION: Places a cyan circle of radius 22 at center (47, 171).
; PLAN: r0=47(x), r1=171(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 171
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
