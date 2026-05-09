; DESCRIPTION: Creates a magenta rectangular region at (201, 52) spanning 116 by 111 pixels.
; PLAN: r0=201(x), r1=52(y), r2=116(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 52
LDI r2, 116
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
