; DESCRIPTION: Places a purple 35x76 rectangle at position (262, 153).
; PLAN: r0=262(x), r1=153(y), r2=35(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 153
LDI r2, 35
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
