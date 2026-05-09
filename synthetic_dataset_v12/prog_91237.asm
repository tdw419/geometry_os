; DESCRIPTION: Places a cyan circle of radius 29 at center (400, 183).
; PLAN: r0=400(x), r1=183(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 183
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
