; DESCRIPTION: Places a blue 91x110 rectangle at position (12, 101).
; PLAN: r0=12(x), r1=101(y), r2=91(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 101
LDI r2, 91
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
