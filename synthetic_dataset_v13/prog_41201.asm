; DESCRIPTION: Places a blue 18x84 rectangle at position (144, 123).
; PLAN: r0=144(x), r1=123(y), r2=18(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 123
LDI r2, 18
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
