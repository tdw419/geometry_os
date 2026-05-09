; DESCRIPTION: Places a white 108x118 rectangle at position (38, 136).
; PLAN: r0=38(x), r1=136(y), r2=108(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 136
LDI r2, 108
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
