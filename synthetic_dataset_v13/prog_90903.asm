; DESCRIPTION: Places a green 107x114 rectangle at position (34, 136).
; PLAN: r0=34(x), r1=136(y), r2=107(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 136
LDI r2, 107
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
