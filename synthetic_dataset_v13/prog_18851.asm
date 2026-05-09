; DESCRIPTION: Creates a white rectangular region at (167, 149) spanning 101 by 70 pixels.
; PLAN: r0=167(x), r1=149(y), r2=101(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 149
LDI r2, 101
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
