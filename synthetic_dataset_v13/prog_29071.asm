; DESCRIPTION: Creates a magenta rectangular region at (315, 145) spanning 28 by 35 pixels.
; PLAN: r0=315(x), r1=145(y), r2=28(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 145
LDI r2, 28
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
