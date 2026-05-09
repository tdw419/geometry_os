; DESCRIPTION: Places a purple 11x13 rectangle at position (175, 63).
; PLAN: r0=175(x), r1=63(y), r2=11(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 63
LDI r2, 11
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
