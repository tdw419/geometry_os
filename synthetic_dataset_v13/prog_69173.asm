; DESCRIPTION: Creates a yellow rectangular region at (127, 52) spanning 35 by 28 pixels.
; PLAN: r0=127(x), r1=52(y), r2=35(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 52
LDI r2, 35
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
