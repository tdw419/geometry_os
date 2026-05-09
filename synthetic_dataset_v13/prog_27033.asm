; DESCRIPTION: Places a cyan circle of radius 74 at center (365, 177).
; PLAN: r0=365(x), r1=177(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 177
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
