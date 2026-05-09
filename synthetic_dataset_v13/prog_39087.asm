; DESCRIPTION: Creates a red rectangular region at (6, 96) spanning 79 by 70 pixels.
; PLAN: r0=6(x), r1=96(y), r2=79(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 96
LDI r2, 79
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
