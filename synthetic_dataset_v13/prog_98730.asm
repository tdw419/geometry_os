; DESCRIPTION: Creates a magenta rectangular region at (211, 54) spanning 29 by 38 pixels.
; PLAN: r0=211(x), r1=54(y), r2=29(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 54
LDI r2, 29
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
