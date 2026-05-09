; DESCRIPTION: Places a purple 74x56 rectangle at position (240, 152).
; PLAN: r0=240(x), r1=152(y), r2=74(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 152
LDI r2, 74
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
