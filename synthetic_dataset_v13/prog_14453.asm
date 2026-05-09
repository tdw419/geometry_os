; DESCRIPTION: Creates a red rectangular region at (251, 88) spanning 109 by 119 pixels.
; PLAN: r0=251(x), r1=88(y), r2=109(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 88
LDI r2, 109
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
