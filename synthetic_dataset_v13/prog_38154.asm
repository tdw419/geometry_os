; DESCRIPTION: Creates a green rectangular region at (435, 99) spanning 41 by 85 pixels.
; PLAN: r0=435(x), r1=99(y), r2=41(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 99
LDI r2, 41
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
