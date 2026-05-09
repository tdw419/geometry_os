; DESCRIPTION: Creates a cyan rectangular region at (110, 88) spanning 58 by 19 pixels.
; PLAN: r0=110(x), r1=88(y), r2=58(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 88
LDI r2, 58
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
