; DESCRIPTION: Places a purple 52x109 rectangle at position (259, 53).
; PLAN: r0=259(x), r1=53(y), r2=52(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 53
LDI r2, 52
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
