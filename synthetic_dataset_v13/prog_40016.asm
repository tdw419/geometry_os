; DESCRIPTION: Places a purple circle of radius 50 at center (403, 57).
; PLAN: r0=403(x), r1=57(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 57
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
