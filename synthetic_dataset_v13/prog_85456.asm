; DESCRIPTION: Places a purple 100x86 rectangle at position (194, 34).
; PLAN: r0=194(x), r1=34(y), r2=100(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 34
LDI r2, 100
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
