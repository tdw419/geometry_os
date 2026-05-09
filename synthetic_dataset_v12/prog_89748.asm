; DESCRIPTION: Places a blue 74x78 rectangle at position (197, 83).
; PLAN: r0=197(x), r1=83(y), r2=74(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 83
LDI r2, 74
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
