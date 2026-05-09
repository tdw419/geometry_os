; DESCRIPTION: Creates a magenta rectangular region at (55, 219) spanning 79 by 29 pixels.
; PLAN: r0=55(x), r1=219(y), r2=79(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 219
LDI r2, 79
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
