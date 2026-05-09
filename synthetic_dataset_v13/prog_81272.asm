; DESCRIPTION: Creates a magenta rectangular region at (80, 95) spanning 93 by 108 pixels.
; PLAN: r0=80(x), r1=95(y), r2=93(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 95
LDI r2, 93
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
