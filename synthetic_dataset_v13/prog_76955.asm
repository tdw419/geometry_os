; DESCRIPTION: Creates a magenta rectangular region at (199, 86) spanning 35 by 79 pixels.
; PLAN: r0=199(x), r1=86(y), r2=35(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 86
LDI r2, 35
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
