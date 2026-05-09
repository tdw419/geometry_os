; DESCRIPTION: Places a magenta 74x105 rectangle at position (383, 9).
; PLAN: r0=383(x), r1=9(y), r2=74(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 9
LDI r2, 74
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
