; DESCRIPTION: Places a cyan circle of radius 64 at center (204, 80).
; PLAN: r0=204(x), r1=80(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 80
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
