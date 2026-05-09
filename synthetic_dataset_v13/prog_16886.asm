; DESCRIPTION: Places a black 29x83 rectangle at position (60, 69).
; PLAN: r0=60(x), r1=69(y), r2=29(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 69
LDI r2, 29
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
