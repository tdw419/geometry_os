; DESCRIPTION: Places a blue 88x105 rectangle at position (90, 106).
; PLAN: r0=90(x), r1=106(y), r2=88(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 106
LDI r2, 88
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
