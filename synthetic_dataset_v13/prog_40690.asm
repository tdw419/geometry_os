; DESCRIPTION: Places a purple 101x63 rectangle at position (261, 137).
; PLAN: r0=261(x), r1=137(y), r2=101(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 137
LDI r2, 101
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
