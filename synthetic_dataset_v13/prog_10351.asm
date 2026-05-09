; DESCRIPTION: Places a purple 61x84 rectangle at position (3, 148).
; PLAN: r0=3(x), r1=148(y), r2=61(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 148
LDI r2, 61
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
