; DESCRIPTION: Places a cyan circle of radius 45 at center (53, 169).
; PLAN: r0=53(x), r1=169(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 169
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
