; DESCRIPTION: Creates a magenta rectangular region at (337, 68) spanning 80 by 98 pixels.
; PLAN: r0=337(x), r1=68(y), r2=80(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 68
LDI r2, 80
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
