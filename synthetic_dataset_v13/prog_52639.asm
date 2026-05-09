; DESCRIPTION: Places a purple 38x49 rectangle at position (259, 205).
; PLAN: r0=259(x), r1=205(y), r2=38(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 205
LDI r2, 38
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
