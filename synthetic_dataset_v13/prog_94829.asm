; DESCRIPTION: Places a black 49x69 rectangle at position (308, 170).
; PLAN: r0=308(x), r1=170(y), r2=49(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 170
LDI r2, 49
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
