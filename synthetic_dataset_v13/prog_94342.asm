; DESCRIPTION: Creates a cyan rectangular region at (119, 88) spanning 27 by 110 pixels.
; PLAN: r0=119(x), r1=88(y), r2=27(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 88
LDI r2, 27
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
