; DESCRIPTION: Creates a magenta rectangular region at (200, 166) spanning 73 by 80 pixels.
; PLAN: r0=200(x), r1=166(y), r2=73(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 166
LDI r2, 73
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
