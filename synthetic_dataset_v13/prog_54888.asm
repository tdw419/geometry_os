; DESCRIPTION: Places a purple 102x30 rectangle at position (71, 53).
; PLAN: r0=71(x), r1=53(y), r2=102(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 53
LDI r2, 102
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
