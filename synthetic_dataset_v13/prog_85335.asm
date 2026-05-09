; DESCRIPTION: Places a blue 62x100 rectangle at position (109, 18).
; PLAN: r0=109(x), r1=18(y), r2=62(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 18
LDI r2, 62
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
