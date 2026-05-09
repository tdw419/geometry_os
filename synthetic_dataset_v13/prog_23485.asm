; DESCRIPTION: Places a purple 114x40 rectangle at position (10, 57).
; PLAN: r0=10(x), r1=57(y), r2=114(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 57
LDI r2, 114
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
