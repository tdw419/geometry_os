; DESCRIPTION: Creates a blue rectangular region at (323, 20) spanning 41 by 47 pixels.
; PLAN: r0=323(x), r1=20(y), r2=41(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 20
LDI r2, 41
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
