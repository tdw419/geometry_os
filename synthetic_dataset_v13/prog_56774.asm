; DESCRIPTION: Places a cyan circle of radius 76 at center (328, 170).
; PLAN: r0=328(x), r1=170(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 170
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
