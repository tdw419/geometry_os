; DESCRIPTION: Places a blue 11x109 rectangle at position (390, 101).
; PLAN: r0=390(x), r1=101(y), r2=11(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 101
LDI r2, 11
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
