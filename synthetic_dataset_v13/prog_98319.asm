; DESCRIPTION: Places a cyan circle of radius 37 at center (153, 167).
; PLAN: r0=153(x), r1=167(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 167
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
