; DESCRIPTION: Creates a magenta rectangular region at (167, 25) spanning 52 by 58 pixels.
; PLAN: r0=167(x), r1=25(y), r2=52(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 25
LDI r2, 52
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
