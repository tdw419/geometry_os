; DESCRIPTION: Creates a white rectangular region at (86, 85) spanning 79 by 114 pixels.
; PLAN: r0=86(x), r1=85(y), r2=79(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 85
LDI r2, 79
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
