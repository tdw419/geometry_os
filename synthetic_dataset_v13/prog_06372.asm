; DESCRIPTION: Creates a cyan rectangular region at (44, 9) spanning 88 by 105 pixels.
; PLAN: r0=44(x), r1=9(y), r2=88(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 9
LDI r2, 88
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
