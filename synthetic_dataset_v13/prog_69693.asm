; DESCRIPTION: Places a purple 28x57 rectangle at position (14, 92).
; PLAN: r0=14(x), r1=92(y), r2=28(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 92
LDI r2, 28
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
