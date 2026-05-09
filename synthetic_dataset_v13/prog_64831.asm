; DESCRIPTION: Creates a magenta rectangular region at (313, 65) spanning 112 by 90 pixels.
; PLAN: r0=313(x), r1=65(y), r2=112(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 65
LDI r2, 112
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
