; DESCRIPTION: Places a purple 96x107 rectangle at position (88, 4).
; PLAN: r0=88(x), r1=4(y), r2=96(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 4
LDI r2, 96
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
