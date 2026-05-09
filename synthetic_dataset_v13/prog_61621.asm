; DESCRIPTION: Places a blue 76x106 rectangle at position (430, 65).
; PLAN: r0=430(x), r1=65(y), r2=76(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 65
LDI r2, 76
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
