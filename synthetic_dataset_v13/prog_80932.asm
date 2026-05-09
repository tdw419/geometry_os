; DESCRIPTION: Places a black 77x102 rectangle at position (255, 53).
; PLAN: r0=255(x), r1=53(y), r2=77(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 53
LDI r2, 77
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
