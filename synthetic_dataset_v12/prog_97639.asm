; DESCRIPTION: Creates a magenta rectangular region at (282, 47) spanning 43 by 35 pixels.
; PLAN: r0=282(x), r1=47(y), r2=43(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 47
LDI r2, 43
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
