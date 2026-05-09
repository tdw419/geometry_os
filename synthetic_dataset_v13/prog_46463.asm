; DESCRIPTION: Places a cyan circle of radius 59 at center (418, 182).
; PLAN: r0=418(x), r1=182(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 182
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
