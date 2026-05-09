; DESCRIPTION: Places a magenta 70x102 rectangle at position (428, 130).
; PLAN: r0=428(x), r1=130(y), r2=70(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 130
LDI r2, 70
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
