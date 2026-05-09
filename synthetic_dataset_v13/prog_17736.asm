; DESCRIPTION: Places a cyan circle of radius 11 at center (422, 36).
; PLAN: r0=422(x), r1=36(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 36
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
