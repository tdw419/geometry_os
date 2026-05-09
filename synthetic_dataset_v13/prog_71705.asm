; DESCRIPTION: Places a black 49x63 rectangle at position (114, 180).
; PLAN: r0=114(x), r1=180(y), r2=49(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 180
LDI r2, 49
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
