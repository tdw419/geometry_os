; DESCRIPTION: Places a magenta 108x10 rectangle at position (315, 32).
; PLAN: r0=315(x), r1=32(y), r2=108(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 32
LDI r2, 108
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
