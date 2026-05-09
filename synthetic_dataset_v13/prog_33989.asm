; DESCRIPTION: Places a purple 119x10 rectangle at position (384, 102).
; PLAN: r0=384(x), r1=102(y), r2=119(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 102
LDI r2, 119
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
