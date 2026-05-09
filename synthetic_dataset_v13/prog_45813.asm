; DESCRIPTION: Places a magenta 84x56 rectangle at position (175, 148).
; PLAN: r0=175(x), r1=148(y), r2=84(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 148
LDI r2, 84
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
