; DESCRIPTION: Places a magenta 70x69 rectangle at position (357, 52).
; PLAN: r0=357(x), r1=52(y), r2=70(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 52
LDI r2, 70
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
