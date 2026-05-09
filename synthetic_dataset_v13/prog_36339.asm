; DESCRIPTION: Places a cyan circle of radius 71 at center (342, 164).
; PLAN: r0=342(x), r1=164(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 164
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
