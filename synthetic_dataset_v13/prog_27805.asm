; DESCRIPTION: Places a purple circle of radius 48 at center (295, 176).
; PLAN: r0=295(x), r1=176(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 176
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
