; DESCRIPTION: Creates a cyan rectangular region at (124, 122) spanning 99 by 38 pixels.
; PLAN: r0=124(x), r1=122(y), r2=99(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 122
LDI r2, 99
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
