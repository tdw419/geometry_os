; DESCRIPTION: Creates a magenta rectangular region at (93, 70) spanning 87 by 29 pixels.
; PLAN: r0=93(x), r1=70(y), r2=87(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 70
LDI r2, 87
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
