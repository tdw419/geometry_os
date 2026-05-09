; DESCRIPTION: Places a blue 118x66 rectangle at position (194, 148).
; PLAN: r0=194(x), r1=148(y), r2=118(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 148
LDI r2, 118
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
