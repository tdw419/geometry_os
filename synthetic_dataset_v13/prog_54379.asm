; DESCRIPTION: Places a black 74x54 rectangle at position (412, 199).
; PLAN: r0=412(x), r1=199(y), r2=74(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 199
LDI r2, 74
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
