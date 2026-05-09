; DESCRIPTION: Places a purple 102x18 rectangle at position (37, 34).
; PLAN: r0=37(x), r1=34(y), r2=102(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 34
LDI r2, 102
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
