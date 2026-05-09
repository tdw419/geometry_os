; DESCRIPTION: Places a purple 21x61 rectangle at position (58, 181).
; PLAN: r0=58(x), r1=181(y), r2=21(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 181
LDI r2, 21
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
