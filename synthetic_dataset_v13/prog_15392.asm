; DESCRIPTION: Places a magenta 22x26 rectangle at position (135, 206).
; PLAN: r0=135(x), r1=206(y), r2=22(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 206
LDI r2, 22
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
