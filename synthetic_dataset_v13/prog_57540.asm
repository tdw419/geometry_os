; DESCRIPTION: Places a magenta 101x56 rectangle at position (138, 19).
; PLAN: r0=138(x), r1=19(y), r2=101(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 19
LDI r2, 101
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
