; DESCRIPTION: Places a blue 44x74 rectangle at position (62, 105).
; PLAN: r0=62(x), r1=105(y), r2=44(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 105
LDI r2, 44
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
