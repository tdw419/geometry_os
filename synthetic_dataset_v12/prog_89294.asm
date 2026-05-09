; DESCRIPTION: Places a magenta 85x69 rectangle at position (64, 178).
; PLAN: r0=64(x), r1=178(y), r2=85(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 178
LDI r2, 85
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
