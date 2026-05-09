; DESCRIPTION: Places a cyan circle of radius 68 at center (205, 177).
; PLAN: r0=205(x), r1=177(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 177
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
