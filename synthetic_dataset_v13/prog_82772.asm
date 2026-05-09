; DESCRIPTION: Places a black 26x74 rectangle at position (160, 115).
; PLAN: r0=160(x), r1=115(y), r2=26(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 115
LDI r2, 26
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
