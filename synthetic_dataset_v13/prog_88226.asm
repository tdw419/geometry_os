; DESCRIPTION: Places a purple 11x106 rectangle at position (362, 43).
; PLAN: r0=362(x), r1=43(y), r2=11(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 43
LDI r2, 11
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
