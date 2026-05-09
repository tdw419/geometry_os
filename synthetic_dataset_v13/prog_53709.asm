; DESCRIPTION: Places a blue 65x108 rectangle at position (64, 75).
; PLAN: r0=64(x), r1=75(y), r2=65(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 75
LDI r2, 65
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
