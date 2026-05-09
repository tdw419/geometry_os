; DESCRIPTION: Creates a green rectangular region at (225, 41) spanning 69 by 100 pixels.
; PLAN: r0=225(x), r1=41(y), r2=69(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 41
LDI r2, 69
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
