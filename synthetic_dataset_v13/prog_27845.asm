; DESCRIPTION: Places a white 115x12 rectangle at position (155, 136).
; PLAN: r0=155(x), r1=136(y), r2=115(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 136
LDI r2, 115
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
