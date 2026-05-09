; DESCRIPTION: Places a blue 58x23 rectangle at position (427, 119).
; PLAN: r0=427(x), r1=119(y), r2=58(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 119
LDI r2, 58
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
