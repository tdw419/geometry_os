; DESCRIPTION: Places a magenta 116x65 rectangle at position (74, 155).
; PLAN: r0=74(x), r1=155(y), r2=116(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 155
LDI r2, 116
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
