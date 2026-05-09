; DESCRIPTION: Places a purple 71x120 rectangle at position (35, 34).
; PLAN: r0=35(x), r1=34(y), r2=71(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 34
LDI r2, 71
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
