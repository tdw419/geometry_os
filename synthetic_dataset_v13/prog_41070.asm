; DESCRIPTION: Creates a white rectangular region at (138, 149) spanning 94 by 96 pixels.
; PLAN: r0=138(x), r1=149(y), r2=94(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 149
LDI r2, 94
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
