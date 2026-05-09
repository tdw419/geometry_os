; DESCRIPTION: Places a purple 11x35 rectangle at position (325, 54).
; PLAN: r0=325(x), r1=54(y), r2=11(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 54
LDI r2, 11
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
