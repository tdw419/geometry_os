; DESCRIPTION: Places a blue 103x34 rectangle at position (232, 137).
; PLAN: r0=232(x), r1=137(y), r2=103(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 137
LDI r2, 103
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
