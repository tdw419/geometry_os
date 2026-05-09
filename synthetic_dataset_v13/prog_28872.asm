; DESCRIPTION: Places a blue 40x19 rectangle at position (68, 147).
; PLAN: r0=68(x), r1=147(y), r2=40(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 147
LDI r2, 40
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
