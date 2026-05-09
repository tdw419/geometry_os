; DESCRIPTION: Places a magenta 59x108 rectangle at position (323, 144).
; PLAN: r0=323(x), r1=144(y), r2=59(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 144
LDI r2, 59
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
