; DESCRIPTION: Places a magenta 78x44 rectangle at position (312, 86).
; PLAN: r0=312(x), r1=86(y), r2=78(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 86
LDI r2, 78
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
