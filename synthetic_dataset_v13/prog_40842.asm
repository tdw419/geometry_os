; DESCRIPTION: Creates a white rectangular region at (181, 110) spanning 95 by 10 pixels.
; PLAN: r0=181(x), r1=110(y), r2=95(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 110
LDI r2, 95
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
