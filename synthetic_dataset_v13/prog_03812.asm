; DESCRIPTION: Creates a yellow rectangular region at (401, 117) spanning 55 by 78 pixels.
; PLAN: r0=401(x), r1=117(y), r2=55(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 117
LDI r2, 55
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
