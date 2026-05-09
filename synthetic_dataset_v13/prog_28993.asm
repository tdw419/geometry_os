; DESCRIPTION: Creates a magenta rectangular region at (376, 70) spanning 100 by 95 pixels.
; PLAN: r0=376(x), r1=70(y), r2=100(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 70
LDI r2, 100
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
