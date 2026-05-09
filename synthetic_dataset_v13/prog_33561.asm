; DESCRIPTION: Places a black 58x107 rectangle at position (25, 104).
; PLAN: r0=25(x), r1=104(y), r2=58(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 104
LDI r2, 58
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
