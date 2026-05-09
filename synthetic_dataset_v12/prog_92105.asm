; DESCRIPTION: Places a blue 30x69 rectangle at position (109, 70).
; PLAN: r0=109(x), r1=70(y), r2=30(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 70
LDI r2, 30
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
