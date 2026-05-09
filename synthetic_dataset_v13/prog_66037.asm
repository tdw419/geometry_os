; DESCRIPTION: Creates a red rectangular region at (11, 84) spanning 96 by 120 pixels.
; PLAN: r0=11(x), r1=84(y), r2=96(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 84
LDI r2, 96
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
