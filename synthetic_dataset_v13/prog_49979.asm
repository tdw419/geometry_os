; DESCRIPTION: Places a magenta 58x69 rectangle at position (201, 34).
; PLAN: r0=201(x), r1=34(y), r2=58(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 34
LDI r2, 58
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
