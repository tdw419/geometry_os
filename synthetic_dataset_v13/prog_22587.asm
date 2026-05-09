; DESCRIPTION: Places a magenta 33x74 rectangle at position (99, 172).
; PLAN: r0=99(x), r1=172(y), r2=33(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 172
LDI r2, 33
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
