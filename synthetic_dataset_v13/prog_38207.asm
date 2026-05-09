; DESCRIPTION: Creates a magenta rectangular region at (85, 61) spanning 44 by 40 pixels.
; PLAN: r0=85(x), r1=61(y), r2=44(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 61
LDI r2, 44
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
