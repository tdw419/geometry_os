; DESCRIPTION: Creates a magenta rectangular region at (419, 121) spanning 87 by 116 pixels.
; PLAN: r0=419(x), r1=121(y), r2=87(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 121
LDI r2, 87
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
