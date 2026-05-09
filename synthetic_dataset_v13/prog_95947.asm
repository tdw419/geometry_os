; DESCRIPTION: Places a purple circle of radius 14 at center (228, 21).
; PLAN: r0=228(x), r1=21(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 21
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
