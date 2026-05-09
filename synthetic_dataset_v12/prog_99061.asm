; DESCRIPTION: Places a black 12x49 rectangle at position (491, 157).
; PLAN: r0=491(x), r1=157(y), r2=12(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 157
LDI r2, 12
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
