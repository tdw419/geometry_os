; DESCRIPTION: Places a blue 76x68 rectangle at position (127, 110).
; PLAN: r0=127(x), r1=110(y), r2=76(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 110
LDI r2, 76
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
