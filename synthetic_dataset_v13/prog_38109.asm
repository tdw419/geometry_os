; DESCRIPTION: Creates a magenta rectangular region at (205, 95) spanning 112 by 17 pixels.
; PLAN: r0=205(x), r1=95(y), r2=112(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 95
LDI r2, 112
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
