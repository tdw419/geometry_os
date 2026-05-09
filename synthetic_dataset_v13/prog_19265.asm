; DESCRIPTION: Places a purple 55x81 rectangle at position (221, 100).
; PLAN: r0=221(x), r1=100(y), r2=55(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 100
LDI r2, 55
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
