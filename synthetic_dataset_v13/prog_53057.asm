; DESCRIPTION: Creates a white rectangular region at (88, 180) spanning 65 by 49 pixels.
; PLAN: r0=88(x), r1=180(y), r2=65(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 180
LDI r2, 65
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
