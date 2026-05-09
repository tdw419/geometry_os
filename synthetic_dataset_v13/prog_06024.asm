; DESCRIPTION: Places a purple 93x49 rectangle at position (140, 69).
; PLAN: r0=140(x), r1=69(y), r2=93(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 69
LDI r2, 93
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
