; DESCRIPTION: Places a black 14x34 rectangle at position (426, 16).
; PLAN: r0=426(x), r1=16(y), r2=14(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 16
LDI r2, 14
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
