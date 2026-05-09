; DESCRIPTION: Places a purple 63x21 rectangle at position (172, 176).
; PLAN: r0=172(x), r1=176(y), r2=63(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 176
LDI r2, 63
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
