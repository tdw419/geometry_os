; DESCRIPTION: Places a purple 75x36 rectangle at position (75, 73).
; PLAN: r0=75(x), r1=73(y), r2=75(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 73
LDI r2, 75
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
