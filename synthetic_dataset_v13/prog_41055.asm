; DESCRIPTION: Places a magenta 93x69 rectangle at position (83, 134).
; PLAN: r0=83(x), r1=134(y), r2=93(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 134
LDI r2, 93
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
