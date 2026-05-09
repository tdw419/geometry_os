; DESCRIPTION: Places a blue 98x88 rectangle at position (77, 110).
; PLAN: r0=77(x), r1=110(y), r2=98(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 110
LDI r2, 98
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
