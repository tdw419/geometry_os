; DESCRIPTION: Places a blue 119x97 rectangle at position (65, 37).
; PLAN: r0=65(x), r1=37(y), r2=119(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 37
LDI r2, 119
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
