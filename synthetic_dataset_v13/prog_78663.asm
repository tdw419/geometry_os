; DESCRIPTION: Places a blue 86x24 rectangle at position (137, 123).
; PLAN: r0=137(x), r1=123(y), r2=86(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 123
LDI r2, 86
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
