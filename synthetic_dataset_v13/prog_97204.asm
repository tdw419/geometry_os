; DESCRIPTION: Places a purple 97x85 rectangle at position (355, 42).
; PLAN: r0=355(x), r1=42(y), r2=97(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 42
LDI r2, 97
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
