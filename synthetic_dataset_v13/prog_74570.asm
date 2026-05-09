; DESCRIPTION: Places a blue 56x20 rectangle at position (49, 78).
; PLAN: r0=49(x), r1=78(y), r2=56(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 78
LDI r2, 56
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
