; DESCRIPTION: Places a purple 74x40 rectangle at position (338, 150).
; PLAN: r0=338(x), r1=150(y), r2=74(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 150
LDI r2, 74
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
