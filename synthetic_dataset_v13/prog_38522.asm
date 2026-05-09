; DESCRIPTION: Places a purple 84x12 rectangle at position (178, 95).
; PLAN: r0=178(x), r1=95(y), r2=84(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 95
LDI r2, 84
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
