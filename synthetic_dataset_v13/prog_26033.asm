; DESCRIPTION: Creates a magenta rectangular region at (81, 121) spanning 31 by 25 pixels.
; PLAN: r0=81(x), r1=121(y), r2=31(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 121
LDI r2, 31
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
