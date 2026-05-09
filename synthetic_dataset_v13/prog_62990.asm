; DESCRIPTION: Places a magenta 74x13 rectangle at position (367, 106).
; PLAN: r0=367(x), r1=106(y), r2=74(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 106
LDI r2, 74
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
