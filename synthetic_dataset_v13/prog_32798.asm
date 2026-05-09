; DESCRIPTION: Places a black 49x71 rectangle at position (327, 17).
; PLAN: r0=327(x), r1=17(y), r2=49(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 17
LDI r2, 49
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
