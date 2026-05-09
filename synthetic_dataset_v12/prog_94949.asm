; DESCRIPTION: Places a cyan circle of radius 73 at center (169, 167).
; PLAN: r0=169(x), r1=167(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 167
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
