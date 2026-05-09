; DESCRIPTION: Places a purple 57x72 rectangle at position (105, 0).
; PLAN: r0=105(x), r1=0(y), r2=57(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 0
LDI r2, 57
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
