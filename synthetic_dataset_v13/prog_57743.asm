; DESCRIPTION: Places a purple 68x52 rectangle at position (334, 119).
; PLAN: r0=334(x), r1=119(y), r2=68(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 119
LDI r2, 68
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
