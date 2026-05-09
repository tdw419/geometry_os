; DESCRIPTION: Places a black 38x24 rectangle at position (114, 126).
; PLAN: r0=114(x), r1=126(y), r2=38(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 126
LDI r2, 38
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
