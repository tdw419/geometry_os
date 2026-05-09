; DESCRIPTION: Creates a red rectangular region at (96, 113) spanning 30 by 69 pixels.
; PLAN: r0=96(x), r1=113(y), r2=30(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 113
LDI r2, 30
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
