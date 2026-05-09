; DESCRIPTION: Places a cyan circle of radius 64 at center (73, 87).
; PLAN: r0=73(x), r1=87(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 87
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
