; DESCRIPTION: Places a blue 63x55 rectangle at position (115, 22).
; PLAN: r0=115(x), r1=22(y), r2=63(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 22
LDI r2, 63
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
