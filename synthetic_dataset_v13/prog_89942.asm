; DESCRIPTION: Places a purple 42x97 rectangle at position (332, 3).
; PLAN: r0=332(x), r1=3(y), r2=42(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 3
LDI r2, 42
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
