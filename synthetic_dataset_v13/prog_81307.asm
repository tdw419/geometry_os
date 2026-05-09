; DESCRIPTION: Places a red 23x88 rectangle at position (414, 144).
; PLAN: r0=414(x), r1=144(y), r2=23(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 144
LDI r2, 23
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
