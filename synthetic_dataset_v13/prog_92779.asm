; DESCRIPTION: Creates a magenta rectangular region at (20, 64) spanning 45 by 95 pixels.
; PLAN: r0=20(x), r1=64(y), r2=45(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 64
LDI r2, 45
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
