; DESCRIPTION: Places a purple 92x66 rectangle at position (38, 26).
; PLAN: r0=38(x), r1=26(y), r2=92(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 26
LDI r2, 92
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
