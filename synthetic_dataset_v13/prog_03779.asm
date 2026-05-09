; DESCRIPTION: Places a purple 73x94 rectangle at position (348, 29).
; PLAN: r0=348(x), r1=29(y), r2=73(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 29
LDI r2, 73
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
