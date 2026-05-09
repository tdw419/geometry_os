; DESCRIPTION: Places a cyan circle of radius 41 at center (271, 62).
; PLAN: r0=271(x), r1=62(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 62
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
