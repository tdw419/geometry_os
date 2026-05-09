; DESCRIPTION: Creates a magenta rectangular region at (103, 169) spanning 95 by 76 pixels.
; PLAN: r0=103(x), r1=169(y), r2=95(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 169
LDI r2, 95
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
