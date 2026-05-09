; DESCRIPTION: Places a purple 47x29 rectangle at position (183, 157).
; PLAN: r0=183(x), r1=157(y), r2=47(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 157
LDI r2, 47
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
