; DESCRIPTION: Creates a magenta rectangular region at (299, 90) spanning 80 by 57 pixels.
; PLAN: r0=299(x), r1=90(y), r2=80(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 90
LDI r2, 80
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
