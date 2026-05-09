; DESCRIPTION: Places a purple 116x30 rectangle at position (91, 36).
; PLAN: r0=91(x), r1=36(y), r2=116(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 36
LDI r2, 116
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
