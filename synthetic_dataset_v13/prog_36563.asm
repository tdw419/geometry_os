; DESCRIPTION: Places a blue 119x28 rectangle at position (366, 65).
; PLAN: r0=366(x), r1=65(y), r2=119(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 65
LDI r2, 119
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
