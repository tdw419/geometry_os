; DESCRIPTION: Creates a magenta rectangular region at (403, 99) spanning 92 by 116 pixels.
; PLAN: r0=403(x), r1=99(y), r2=92(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 99
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
