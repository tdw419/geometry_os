; DESCRIPTION: Places a purple 100x34 rectangle at position (95, 183).
; PLAN: r0=95(x), r1=183(y), r2=100(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 183
LDI r2, 100
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
