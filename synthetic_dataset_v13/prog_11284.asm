; DESCRIPTION: Places a purple 88x16 rectangle at position (150, 193).
; PLAN: r0=150(x), r1=193(y), r2=88(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 193
LDI r2, 88
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
