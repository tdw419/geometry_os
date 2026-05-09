; DESCRIPTION: Places a purple 84x95 rectangle at position (308, 9).
; PLAN: r0=308(x), r1=9(y), r2=84(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 9
LDI r2, 84
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
