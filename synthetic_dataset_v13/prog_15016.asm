; DESCRIPTION: Places a magenta 72x108 rectangle at position (246, 81).
; PLAN: r0=246(x), r1=81(y), r2=72(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 81
LDI r2, 72
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
