; DESCRIPTION: Creates a yellow rectangular region at (391, 105) spanning 68 by 84 pixels.
; PLAN: r0=391(x), r1=105(y), r2=68(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 105
LDI r2, 68
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
