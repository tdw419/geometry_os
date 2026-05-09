; DESCRIPTION: Places a blue 108x75 rectangle at position (329, 2).
; PLAN: r0=329(x), r1=2(y), r2=108(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 2
LDI r2, 108
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
