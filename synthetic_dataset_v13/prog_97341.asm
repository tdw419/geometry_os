; DESCRIPTION: Places a magenta 108x72 rectangle at position (148, 33).
; PLAN: r0=148(x), r1=33(y), r2=108(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 33
LDI r2, 108
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
