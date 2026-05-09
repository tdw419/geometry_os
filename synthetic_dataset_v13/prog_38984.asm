; DESCRIPTION: Renders a blue box of size 13x68 starting at (376, 58).
; PLAN: r0=376(x), r1=58(y), r2=13(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 58
LDI r2, 13
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
