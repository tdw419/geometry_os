; DESCRIPTION: Places a purple 82x62 rectangle at position (7, 147).
; PLAN: r0=7(x), r1=147(y), r2=82(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 147
LDI r2, 82
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
