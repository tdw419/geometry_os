; DESCRIPTION: Creates a white rectangular region at (254, 9) spanning 14 by 22 pixels.
; PLAN: r0=254(x), r1=9(y), r2=14(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 9
LDI r2, 14
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
