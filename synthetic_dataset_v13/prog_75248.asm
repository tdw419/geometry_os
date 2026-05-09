; DESCRIPTION: Places a purple 113x51 rectangle at position (364, 95).
; PLAN: r0=364(x), r1=95(y), r2=113(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 95
LDI r2, 113
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
