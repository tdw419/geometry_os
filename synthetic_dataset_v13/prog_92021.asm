; DESCRIPTION: Places a blue 100x40 rectangle at position (249, 13).
; PLAN: r0=249(x), r1=13(y), r2=100(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 13
LDI r2, 100
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
