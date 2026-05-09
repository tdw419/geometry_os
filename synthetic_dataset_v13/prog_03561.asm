; DESCRIPTION: Places a magenta 54x97 rectangle at position (23, 106).
; PLAN: r0=23(x), r1=106(y), r2=54(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 106
LDI r2, 54
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
