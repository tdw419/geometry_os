; DESCRIPTION: Places a cyan circle of radius 53 at center (185, 167).
; PLAN: r0=185(x), r1=167(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 167
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
