; DESCRIPTION: Places a blue 62x18 rectangle at position (0, 84).
; PLAN: r0=0(x), r1=84(y), r2=62(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 84
LDI r2, 62
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
