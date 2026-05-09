; DESCRIPTION: Creates a green rectangular region at (380, 45) spanning 70 by 41 pixels.
; PLAN: r0=380(x), r1=45(y), r2=70(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 45
LDI r2, 70
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
