; DESCRIPTION: Places a blue 38x85 rectangle at position (469, 147).
; PLAN: r0=469(x), r1=147(y), r2=38(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 147
LDI r2, 38
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
