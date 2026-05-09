; DESCRIPTION: Creates a magenta rectangular region at (304, 19) spanning 95 by 51 pixels.
; PLAN: r0=304(x), r1=19(y), r2=95(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 19
LDI r2, 95
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
