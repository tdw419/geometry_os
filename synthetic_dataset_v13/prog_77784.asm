; DESCRIPTION: Creates a magenta rectangular region at (75, 168) spanning 35 by 77 pixels.
; PLAN: r0=75(x), r1=168(y), r2=35(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 168
LDI r2, 35
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
