; DESCRIPTION: Places a purple 36x37 rectangle at position (252, 63).
; PLAN: r0=252(x), r1=63(y), r2=36(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 63
LDI r2, 36
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
