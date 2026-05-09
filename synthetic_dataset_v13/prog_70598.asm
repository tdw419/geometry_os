; DESCRIPTION: Places a magenta 86x25 rectangle at position (312, 2).
; PLAN: r0=312(x), r1=2(y), r2=86(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 2
LDI r2, 86
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
