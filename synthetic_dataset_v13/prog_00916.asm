; DESCRIPTION: Creates a magenta rectangular region at (133, 61) spanning 45 by 48 pixels.
; PLAN: r0=133(x), r1=61(y), r2=45(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 61
LDI r2, 45
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
