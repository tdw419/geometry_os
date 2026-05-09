; DESCRIPTION: Places a purple 74x35 rectangle at position (199, 23).
; PLAN: r0=199(x), r1=23(y), r2=74(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 23
LDI r2, 74
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
