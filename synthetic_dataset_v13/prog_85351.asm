; DESCRIPTION: Creates a yellow rectangular region at (266, 105) spanning 27 by 25 pixels.
; PLAN: r0=266(x), r1=105(y), r2=27(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 105
LDI r2, 27
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
