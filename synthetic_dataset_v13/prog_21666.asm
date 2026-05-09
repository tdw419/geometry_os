; DESCRIPTION: Places a purple 15x10 rectangle at position (34, 22).
; PLAN: r0=34(x), r1=22(y), r2=15(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 22
LDI r2, 15
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
