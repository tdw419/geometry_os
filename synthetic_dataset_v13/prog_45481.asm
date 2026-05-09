; DESCRIPTION: Places a black 49x60 rectangle at position (276, 4).
; PLAN: r0=276(x), r1=4(y), r2=49(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 4
LDI r2, 49
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
