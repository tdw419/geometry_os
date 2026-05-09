; DESCRIPTION: Creates a yellow rectangular region at (9, 210) spanning 97 by 20 pixels.
; PLAN: r0=9(x), r1=210(y), r2=97(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 210
LDI r2, 97
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
