; DESCRIPTION: Places a red 114x62 rectangle at position (149, 118).
; PLAN: r0=149(x), r1=118(y), r2=114(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 118
LDI r2, 114
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
