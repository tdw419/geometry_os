; DESCRIPTION: Places a purple 100x34 rectangle at position (264, 71).
; PLAN: r0=264(x), r1=71(y), r2=100(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 71
LDI r2, 100
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
