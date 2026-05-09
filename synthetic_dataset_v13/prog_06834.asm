; DESCRIPTION: Places a magenta 39x117 rectangle at position (109, 78).
; PLAN: r0=109(x), r1=78(y), r2=39(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 78
LDI r2, 39
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
