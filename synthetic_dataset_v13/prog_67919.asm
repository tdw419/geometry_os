; DESCRIPTION: Places a black 20x104 rectangle at position (53, 49).
; PLAN: r0=53(x), r1=49(y), r2=20(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 49
LDI r2, 20
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
