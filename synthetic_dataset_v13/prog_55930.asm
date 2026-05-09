; DESCRIPTION: Places a white 119x62 rectangle at position (101, 114).
; PLAN: r0=101(x), r1=114(y), r2=119(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 114
LDI r2, 119
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
