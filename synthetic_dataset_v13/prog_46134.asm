; DESCRIPTION: Creates a magenta rectangular region at (161, 165) spanning 77 by 17 pixels.
; PLAN: r0=161(x), r1=165(y), r2=77(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 165
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
