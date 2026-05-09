; DESCRIPTION: Places a purple 88x30 rectangle at position (7, 213).
; PLAN: r0=7(x), r1=213(y), r2=88(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 213
LDI r2, 88
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
