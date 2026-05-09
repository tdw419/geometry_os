; DESCRIPTION: Creates a magenta rectangular region at (82, 120) spanning 77 by 119 pixels.
; PLAN: r0=82(x), r1=120(y), r2=77(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 120
LDI r2, 77
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
