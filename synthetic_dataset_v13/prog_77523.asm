; DESCRIPTION: Places a purple 86x30 rectangle at position (123, 83).
; PLAN: r0=123(x), r1=83(y), r2=86(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 83
LDI r2, 86
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
