; DESCRIPTION: Creates a white rectangular region at (1, 151) spanning 96 by 85 pixels.
; PLAN: r0=1(x), r1=151(y), r2=96(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 151
LDI r2, 96
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
