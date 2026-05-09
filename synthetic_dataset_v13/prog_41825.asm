; DESCRIPTION: Creates a magenta rectangular region at (454, 60) spanning 12 by 116 pixels.
; PLAN: r0=454(x), r1=60(y), r2=12(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 60
LDI r2, 12
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
