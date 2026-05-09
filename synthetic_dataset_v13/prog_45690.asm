; DESCRIPTION: Places a purple 84x102 rectangle at position (100, 52).
; PLAN: r0=100(x), r1=52(y), r2=84(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 52
LDI r2, 84
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
