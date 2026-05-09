; DESCRIPTION: Renders a purple disk with center (218, 38) and radius 16.
; PLAN: r0=218(x), r1=38(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 38
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
