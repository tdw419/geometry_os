; DESCRIPTION: Places a blue 62x20 rectangle at position (101, 156).
; PLAN: r0=101(x), r1=156(y), r2=62(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 156
LDI r2, 62
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
