; DESCRIPTION: Places a cyan circle of radius 25 at center (153, 92).
; PLAN: r0=153(x), r1=92(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 92
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
