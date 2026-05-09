; DESCRIPTION: Places a purple 97x38 rectangle at position (262, 7).
; PLAN: r0=262(x), r1=7(y), r2=97(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 7
LDI r2, 97
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
