; DESCRIPTION: Places a magenta 115x69 rectangle at position (106, 20).
; PLAN: r0=106(x), r1=20(y), r2=115(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 20
LDI r2, 115
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
