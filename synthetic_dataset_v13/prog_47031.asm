; DESCRIPTION: Places a magenta 117x59 rectangle at position (318, 62).
; PLAN: r0=318(x), r1=62(y), r2=117(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 62
LDI r2, 117
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
