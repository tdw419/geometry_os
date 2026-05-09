; DESCRIPTION: Creates a green rectangular region at (433, 27) spanning 78 by 110 pixels.
; PLAN: r0=433(x), r1=27(y), r2=78(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 27
LDI r2, 78
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
