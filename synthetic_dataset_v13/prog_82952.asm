; DESCRIPTION: Places a blue 109x25 rectangle at position (109, 69).
; PLAN: r0=109(x), r1=69(y), r2=109(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 69
LDI r2, 109
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
