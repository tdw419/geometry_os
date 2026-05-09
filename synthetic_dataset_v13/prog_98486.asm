; DESCRIPTION: Places a black 49x30 rectangle at position (413, 181).
; PLAN: r0=413(x), r1=181(y), r2=49(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 181
LDI r2, 49
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
