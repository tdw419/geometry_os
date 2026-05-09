; DESCRIPTION: Creates a white rectangular region at (70, 22) spanning 57 by 105 pixels.
; PLAN: r0=70(x), r1=22(y), r2=57(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 22
LDI r2, 57
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
