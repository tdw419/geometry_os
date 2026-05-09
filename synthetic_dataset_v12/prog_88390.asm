; DESCRIPTION: Places a purple 69x71 rectangle at position (323, 20).
; PLAN: r0=323(x), r1=20(y), r2=69(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 20
LDI r2, 69
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
