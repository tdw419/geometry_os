; DESCRIPTION: Creates a magenta rectangular region at (308, 4) spanning 95 by 62 pixels.
; PLAN: r0=308(x), r1=4(y), r2=95(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 4
LDI r2, 95
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
