; DESCRIPTION: Places a magenta 10x44 rectangle at position (94, 194).
; PLAN: r0=94(x), r1=194(y), r2=10(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 194
LDI r2, 10
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
