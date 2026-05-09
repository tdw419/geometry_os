; DESCRIPTION: Places a cyan 62x110 rectangle at position (155, 100).
; PLAN: r0=155(x), r1=100(y), r2=62(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 100
LDI r2, 62
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
