; DESCRIPTION: Places a purple 19x103 rectangle at position (143, 124).
; PLAN: r0=143(x), r1=124(y), r2=19(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 124
LDI r2, 19
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
