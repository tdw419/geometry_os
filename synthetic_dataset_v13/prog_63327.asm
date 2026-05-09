; DESCRIPTION: Creates a yellow rectangular region at (25, 43) spanning 120 by 97 pixels.
; PLAN: r0=25(x), r1=43(y), r2=120(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 43
LDI r2, 120
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
