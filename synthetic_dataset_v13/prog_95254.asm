; DESCRIPTION: Places a magenta 69x116 rectangle at position (429, 57).
; PLAN: r0=429(x), r1=57(y), r2=69(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 57
LDI r2, 69
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
