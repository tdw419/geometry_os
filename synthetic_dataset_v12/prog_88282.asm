; DESCRIPTION: Places a magenta 102x96 rectangle at position (14, 1).
; PLAN: r0=14(x), r1=1(y), r2=102(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 1
LDI r2, 102
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
