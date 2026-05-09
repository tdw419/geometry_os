; DESCRIPTION: Places a purple 77x55 rectangle at position (52, 124).
; PLAN: r0=52(x), r1=124(y), r2=77(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 124
LDI r2, 77
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
