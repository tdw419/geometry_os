; DESCRIPTION: Places a magenta 110x13 rectangle at position (121, 77).
; PLAN: r0=121(x), r1=77(y), r2=110(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 77
LDI r2, 110
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
