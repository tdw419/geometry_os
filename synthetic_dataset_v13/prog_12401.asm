; DESCRIPTION: Places a cyan circle of radius 53 at center (283, 173).
; PLAN: r0=283(x), r1=173(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 173
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
