; DESCRIPTION: Places a blue 52x110 rectangle at position (69, 24).
; PLAN: r0=69(x), r1=24(y), r2=52(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 24
LDI r2, 52
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
