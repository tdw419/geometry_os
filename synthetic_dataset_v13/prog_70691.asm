; DESCRIPTION: Places a purple 114x92 rectangle at position (120, 117).
; PLAN: r0=120(x), r1=117(y), r2=114(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 117
LDI r2, 114
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
