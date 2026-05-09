; DESCRIPTION: Places a magenta 84x69 rectangle at position (202, 155).
; PLAN: r0=202(x), r1=155(y), r2=84(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 155
LDI r2, 84
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
