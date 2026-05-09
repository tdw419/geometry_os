; DESCRIPTION: Places a green 88x29 rectangle at position (402, 147).
; PLAN: r0=402(x), r1=147(y), r2=88(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 147
LDI r2, 88
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
