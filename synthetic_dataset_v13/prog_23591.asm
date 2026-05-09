; DESCRIPTION: Creates a white rectangular region at (366, 216) spanning 100 by 20 pixels.
; PLAN: r0=366(x), r1=216(y), r2=100(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 216
LDI r2, 100
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
