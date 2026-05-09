; DESCRIPTION: Places a magenta 44x75 rectangle at position (225, 69).
; PLAN: r0=225(x), r1=69(y), r2=44(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 69
LDI r2, 44
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
