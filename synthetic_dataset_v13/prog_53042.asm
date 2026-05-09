; DESCRIPTION: Places a blue 80x30 rectangle at position (78, 148).
; PLAN: r0=78(x), r1=148(y), r2=80(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 148
LDI r2, 80
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
