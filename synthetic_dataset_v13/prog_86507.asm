; DESCRIPTION: Places a purple 60x92 rectangle at position (130, 116).
; PLAN: r0=130(x), r1=116(y), r2=60(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 116
LDI r2, 60
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
