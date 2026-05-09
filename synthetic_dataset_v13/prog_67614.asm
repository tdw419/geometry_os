; DESCRIPTION: Places a magenta 118x10 rectangle at position (108, 204).
; PLAN: r0=108(x), r1=204(y), r2=118(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 204
LDI r2, 118
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
