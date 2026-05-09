; DESCRIPTION: Places a blue 58x24 rectangle at position (338, 17).
; PLAN: r0=338(x), r1=17(y), r2=58(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 17
LDI r2, 58
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
