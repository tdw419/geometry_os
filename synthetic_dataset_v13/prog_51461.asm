; DESCRIPTION: Places a black 26x111 rectangle at position (142, 137).
; PLAN: r0=142(x), r1=137(y), r2=26(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 137
LDI r2, 26
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
