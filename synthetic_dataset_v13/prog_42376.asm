; DESCRIPTION: Creates a magenta rectangular region at (308, 5) spanning 101 by 96 pixels.
; PLAN: r0=308(x), r1=5(y), r2=101(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 5
LDI r2, 101
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
