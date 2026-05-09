; DESCRIPTION: Places a purple 114x88 rectangle at position (160, 143).
; PLAN: r0=160(x), r1=143(y), r2=114(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 143
LDI r2, 114
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
