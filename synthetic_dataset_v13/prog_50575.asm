; DESCRIPTION: Creates a magenta rectangular region at (229, 121) spanning 95 by 115 pixels.
; PLAN: r0=229(x), r1=121(y), r2=95(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 121
LDI r2, 95
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
