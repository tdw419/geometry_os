; DESCRIPTION: Places a cyan circle of radius 64 at center (403, 121).
; PLAN: r0=403(x), r1=121(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 121
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
