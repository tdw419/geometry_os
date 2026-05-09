; DESCRIPTION: Places a purple 33x117 rectangle at position (151, 2).
; PLAN: r0=151(x), r1=2(y), r2=33(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 2
LDI r2, 33
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
