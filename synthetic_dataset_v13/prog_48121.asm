; DESCRIPTION: Creates a magenta rectangular region at (271, 95) spanning 73 by 49 pixels.
; PLAN: r0=271(x), r1=95(y), r2=73(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 95
LDI r2, 73
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
