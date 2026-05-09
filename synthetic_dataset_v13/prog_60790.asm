; DESCRIPTION: Places a blue 99x11 rectangle at position (150, 69).
; PLAN: r0=150(x), r1=69(y), r2=99(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 69
LDI r2, 99
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
