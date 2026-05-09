; DESCRIPTION: Places a black 24x96 rectangle at position (97, 104).
; PLAN: r0=97(x), r1=104(y), r2=24(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 104
LDI r2, 24
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
