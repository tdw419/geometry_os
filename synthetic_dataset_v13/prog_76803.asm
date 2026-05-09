; DESCRIPTION: Creates a blue rectangular region at (182, 70) spanning 41 by 85 pixels.
; PLAN: r0=182(x), r1=70(y), r2=41(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 70
LDI r2, 41
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
