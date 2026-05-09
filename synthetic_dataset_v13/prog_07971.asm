; DESCRIPTION: Creates a magenta rectangular region at (383, 59) spanning 85 by 77 pixels.
; PLAN: r0=383(x), r1=59(y), r2=85(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 59
LDI r2, 85
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
