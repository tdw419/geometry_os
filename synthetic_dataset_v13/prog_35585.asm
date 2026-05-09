; DESCRIPTION: Creates a blue rectangular region at (172, 214) spanning 100 by 41 pixels.
; PLAN: r0=172(x), r1=214(y), r2=100(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 214
LDI r2, 100
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
