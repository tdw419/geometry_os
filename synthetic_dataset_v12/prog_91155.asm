; DESCRIPTION: Places a magenta 18x17 rectangle at position (489, 163).
; PLAN: r0=489(x), r1=163(y), r2=18(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 163
LDI r2, 18
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
