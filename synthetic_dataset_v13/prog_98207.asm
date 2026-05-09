; DESCRIPTION: Creates a magenta rectangular region at (171, 68) spanning 55 by 52 pixels.
; PLAN: r0=171(x), r1=68(y), r2=55(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 68
LDI r2, 55
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
