; DESCRIPTION: Creates a magenta rectangular region at (218, 50) spanning 118 by 53 pixels.
; PLAN: r0=218(x), r1=50(y), r2=118(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 50
LDI r2, 118
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
