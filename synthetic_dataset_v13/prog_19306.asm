; DESCRIPTION: Creates a white rectangular region at (132, 161) spanning 12 by 66 pixels.
; PLAN: r0=132(x), r1=161(y), r2=12(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 161
LDI r2, 12
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
