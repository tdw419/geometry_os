; DESCRIPTION: Places a cyan circle of radius 36 at center (71, 74).
; PLAN: r0=71(x), r1=74(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 74
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
