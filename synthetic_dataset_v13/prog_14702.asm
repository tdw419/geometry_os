; DESCRIPTION: Places a cyan circle of radius 21 at center (117, 177).
; PLAN: r0=117(x), r1=177(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 177
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
