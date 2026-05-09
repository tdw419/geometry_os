; DESCRIPTION: Places a magenta 29x75 rectangle at position (406, 69).
; PLAN: r0=406(x), r1=69(y), r2=29(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 69
LDI r2, 29
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
