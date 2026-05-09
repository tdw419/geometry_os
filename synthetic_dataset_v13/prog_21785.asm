; DESCRIPTION: Places a purple 105x52 rectangle at position (126, 159).
; PLAN: r0=126(x), r1=159(y), r2=105(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 159
LDI r2, 105
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
