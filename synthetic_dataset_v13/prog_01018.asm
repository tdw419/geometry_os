; DESCRIPTION: Places a magenta 39x14 rectangle at position (318, 131).
; PLAN: r0=318(x), r1=131(y), r2=39(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 131
LDI r2, 39
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
