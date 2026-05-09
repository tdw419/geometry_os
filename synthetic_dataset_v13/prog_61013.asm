; DESCRIPTION: Creates a magenta rectangular region at (273, 95) spanning 85 by 18 pixels.
; PLAN: r0=273(x), r1=95(y), r2=85(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 95
LDI r2, 85
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
