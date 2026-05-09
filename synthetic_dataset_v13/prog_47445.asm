; DESCRIPTION: Places a yellow 88x63 rectangle at position (20, 58).
; PLAN: r0=20(x), r1=58(y), r2=88(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 58
LDI r2, 88
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
