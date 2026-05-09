; DESCRIPTION: Places a cyan circle of radius 32 at center (33, 38).
; PLAN: r0=33(x), r1=38(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 38
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
