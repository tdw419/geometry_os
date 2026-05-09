; DESCRIPTION: Places a purple 81x23 rectangle at position (85, 150).
; PLAN: r0=85(x), r1=150(y), r2=81(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 150
LDI r2, 81
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
