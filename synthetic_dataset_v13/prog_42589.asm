; DESCRIPTION: Creates a magenta rectangular region at (75, 200) spanning 95 by 51 pixels.
; PLAN: r0=75(x), r1=200(y), r2=95(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 200
LDI r2, 95
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
