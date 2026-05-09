; DESCRIPTION: Places a magenta 29x46 rectangle at position (84, 44).
; PLAN: r0=84(x), r1=44(y), r2=29(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 44
LDI r2, 29
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
