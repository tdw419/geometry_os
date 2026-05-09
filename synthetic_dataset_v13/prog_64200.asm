; DESCRIPTION: Creates a magenta rectangular region at (314, 112) spanning 43 by 70 pixels.
; PLAN: r0=314(x), r1=112(y), r2=43(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 112
LDI r2, 43
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
