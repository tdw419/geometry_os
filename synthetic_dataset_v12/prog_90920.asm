; DESCRIPTION: Creates a green rectangular region at (110, 113) spanning 14 by 12 pixels.
; PLAN: r0=110(x), r1=113(y), r2=14(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 113
LDI r2, 14
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
