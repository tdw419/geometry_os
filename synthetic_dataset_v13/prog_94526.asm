; DESCRIPTION: Places a magenta 36x108 rectangle at position (440, 100).
; PLAN: r0=440(x), r1=100(y), r2=36(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 100
LDI r2, 36
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
