; DESCRIPTION: Places a magenta 90x59 rectangle at position (49, 8).
; PLAN: r0=49(x), r1=8(y), r2=90(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 8
LDI r2, 90
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
