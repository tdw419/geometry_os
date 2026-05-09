; DESCRIPTION: Creates a magenta rectangular region at (312, 51) spanning 45 by 78 pixels.
; PLAN: r0=312(x), r1=51(y), r2=45(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 51
LDI r2, 45
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
