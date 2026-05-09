; DESCRIPTION: Places a cyan circle of radius 73 at center (131, 182).
; PLAN: r0=131(x), r1=182(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 182
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
