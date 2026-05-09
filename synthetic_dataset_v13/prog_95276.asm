; DESCRIPTION: Places a purple 43x22 rectangle at position (95, 127).
; PLAN: r0=95(x), r1=127(y), r2=43(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 127
LDI r2, 43
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
