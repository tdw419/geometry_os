; DESCRIPTION: Creates a red rectangular region at (135, 79) spanning 106 by 85 pixels.
; PLAN: r0=135(x), r1=79(y), r2=106(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 79
LDI r2, 106
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
