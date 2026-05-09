; DESCRIPTION: Places a magenta 39x62 rectangle at position (312, 68).
; PLAN: r0=312(x), r1=68(y), r2=39(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 68
LDI r2, 39
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
