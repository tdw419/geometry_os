; DESCRIPTION: Places a blue 75x102 rectangle at position (310, 63).
; PLAN: r0=310(x), r1=63(y), r2=75(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 63
LDI r2, 75
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
