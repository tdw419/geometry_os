; DESCRIPTION: Creates a green rectangular region at (171, 110) spanning 85 by 19 pixels.
; PLAN: r0=171(x), r1=110(y), r2=85(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 110
LDI r2, 85
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
