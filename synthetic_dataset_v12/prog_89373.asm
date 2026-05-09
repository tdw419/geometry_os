; DESCRIPTION: Places a magenta 116x50 rectangle at position (335, 43).
; PLAN: r0=335(x), r1=43(y), r2=116(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 43
LDI r2, 116
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
