; DESCRIPTION: Creates a blue rectangular region at (80, 91) spanning 31 by 41 pixels.
; PLAN: r0=80(x), r1=91(y), r2=31(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 91
LDI r2, 31
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
