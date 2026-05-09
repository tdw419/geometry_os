; DESCRIPTION: Places a cyan circle of radius 38 at center (137, 214).
; PLAN: r0=137(x), r1=214(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 214
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
