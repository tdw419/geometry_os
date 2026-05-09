; DESCRIPTION: Places a purple 78x30 rectangle at position (213, 70).
; PLAN: r0=213(x), r1=70(y), r2=78(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 70
LDI r2, 78
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
