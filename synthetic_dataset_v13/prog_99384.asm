; DESCRIPTION: Creates a cyan rectangular region at (315, 122) spanning 10 by 99 pixels.
; PLAN: r0=315(x), r1=122(y), r2=10(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 122
LDI r2, 10
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
