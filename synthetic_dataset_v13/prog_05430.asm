; DESCRIPTION: Creates a magenta rectangular region at (384, 51) spanning 12 by 34 pixels.
; PLAN: r0=384(x), r1=51(y), r2=12(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 51
LDI r2, 12
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
