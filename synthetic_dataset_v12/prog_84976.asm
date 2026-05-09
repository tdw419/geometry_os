; DESCRIPTION: Places a purple 70x56 rectangle at position (327, 5).
; PLAN: r0=327(x), r1=5(y), r2=70(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 5
LDI r2, 70
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
