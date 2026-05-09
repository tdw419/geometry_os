; DESCRIPTION: Places a purple 117x28 rectangle at position (85, 2).
; PLAN: r0=85(x), r1=2(y), r2=117(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 2
LDI r2, 117
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
