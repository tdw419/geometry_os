; DESCRIPTION: Creates a magenta rectangular region at (313, 85) spanning 120 by 119 pixels.
; PLAN: r0=313(x), r1=85(y), r2=120(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 85
LDI r2, 120
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
