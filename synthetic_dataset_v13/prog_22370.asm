; DESCRIPTION: Places a blue 88x54 rectangle at position (241, 89).
; PLAN: r0=241(x), r1=89(y), r2=88(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 89
LDI r2, 88
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
