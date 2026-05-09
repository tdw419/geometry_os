; DESCRIPTION: Creates a green rectangular region at (3, 31) spanning 19 by 29 pixels.
; PLAN: r0=3(x), r1=31(y), r2=19(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 31
LDI r2, 19
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
