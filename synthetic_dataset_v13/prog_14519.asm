; DESCRIPTION: Places a purple 19x25 rectangle at position (327, 99).
; PLAN: r0=327(x), r1=99(y), r2=19(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 99
LDI r2, 19
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
