; DESCRIPTION: Places a cyan circle of radius 26 at center (418, 206).
; PLAN: r0=418(x), r1=206(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 206
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
