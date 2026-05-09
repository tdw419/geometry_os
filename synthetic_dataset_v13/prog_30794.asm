; DESCRIPTION: Creates a magenta rectangular region at (5, 206) spanning 110 by 15 pixels.
; PLAN: r0=5(x), r1=206(y), r2=110(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 206
LDI r2, 110
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
