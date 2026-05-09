; DESCRIPTION: Places a purple 88x19 rectangle at position (126, 126).
; PLAN: r0=126(x), r1=126(y), r2=88(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 126
LDI r2, 88
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
