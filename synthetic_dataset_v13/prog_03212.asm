; DESCRIPTION: Places a blue 58x94 rectangle at position (453, 26).
; PLAN: r0=453(x), r1=26(y), r2=58(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 26
LDI r2, 58
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
