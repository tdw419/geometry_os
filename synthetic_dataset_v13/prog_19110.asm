; DESCRIPTION: Creates a blue rectangular region at (108, 65) spanning 113 by 41 pixels.
; PLAN: r0=108(x), r1=65(y), r2=113(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 113
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
