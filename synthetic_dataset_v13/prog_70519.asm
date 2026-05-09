; DESCRIPTION: Creates a cyan rectangular region at (485, 78) spanning 22 by 120 pixels.
; PLAN: r0=485(x), r1=78(y), r2=22(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 78
LDI r2, 22
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
