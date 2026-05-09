; DESCRIPTION: Creates a purple circular shape at (410, 120) with radius 72.
; PLAN: r0=410(x), r1=120(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 120
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
