; DESCRIPTION: Places a blue 91x119 rectangle at position (16, 40).
; PLAN: r0=16(x), r1=40(y), r2=91(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 40
LDI r2, 91
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
