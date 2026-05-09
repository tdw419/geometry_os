; DESCRIPTION: Creates a blue rectangular region at (485, 0) spanning 21 by 46 pixels.
; PLAN: r0=485(x), r1=0(y), r2=21(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 0
LDI r2, 21
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
