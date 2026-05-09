; DESCRIPTION: Creates a blue rectangular region at (234, 210) spanning 33 by 41 pixels.
; PLAN: r0=234(x), r1=210(y), r2=33(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 210
LDI r2, 33
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
