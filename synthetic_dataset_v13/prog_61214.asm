; DESCRIPTION: Places a cyan circle of radius 55 at center (238, 200).
; PLAN: r0=238(x), r1=200(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 200
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
