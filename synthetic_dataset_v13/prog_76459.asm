; DESCRIPTION: Places a purple 57x36 rectangle at position (43, 218).
; PLAN: r0=43(x), r1=218(y), r2=57(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 218
LDI r2, 57
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
