; DESCRIPTION: Places a cyan circle of radius 26 at center (177, 225).
; PLAN: r0=177(x), r1=225(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 225
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
