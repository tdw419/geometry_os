; DESCRIPTION: Creates a magenta rectangular region at (217, 72) spanning 34 by 57 pixels.
; PLAN: r0=217(x), r1=72(y), r2=34(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 72
LDI r2, 34
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
