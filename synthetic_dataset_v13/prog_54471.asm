; DESCRIPTION: Places a purple 36x74 rectangle at position (287, 95).
; PLAN: r0=287(x), r1=95(y), r2=36(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 95
LDI r2, 36
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
