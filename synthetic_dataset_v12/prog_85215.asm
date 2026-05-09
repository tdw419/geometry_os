; DESCRIPTION: Places a magenta 91x69 rectangle at position (397, 177).
; PLAN: r0=397(x), r1=177(y), r2=91(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 177
LDI r2, 91
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
