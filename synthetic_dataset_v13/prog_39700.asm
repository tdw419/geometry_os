; DESCRIPTION: Places a black 47x111 rectangle at position (366, 62).
; PLAN: r0=366(x), r1=62(y), r2=47(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 62
LDI r2, 47
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
