; DESCRIPTION: Places a cyan circle of radius 45 at center (172, 118).
; PLAN: r0=172(x), r1=118(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 118
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
