; DESCRIPTION: Places a purple 94x95 rectangle at position (312, 1).
; PLAN: r0=312(x), r1=1(y), r2=94(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 1
LDI r2, 94
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
