; DESCRIPTION: Creates a magenta rectangular region at (8, 146) spanning 95 by 92 pixels.
; PLAN: r0=8(x), r1=146(y), r2=95(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 146
LDI r2, 95
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
