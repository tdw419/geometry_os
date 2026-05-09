; DESCRIPTION: Places a purple 15x60 rectangle at position (355, 194).
; PLAN: r0=355(x), r1=194(y), r2=15(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 194
LDI r2, 15
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
