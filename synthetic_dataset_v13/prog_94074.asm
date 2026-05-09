; DESCRIPTION: Places a black 23x43 rectangle at position (4, 104).
; PLAN: r0=4(x), r1=104(y), r2=23(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 104
LDI r2, 23
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
