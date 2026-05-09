; DESCRIPTION: Creates a yellow rectangular region at (39, 19) spanning 44 by 89 pixels.
; PLAN: r0=39(x), r1=19(y), r2=44(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 19
LDI r2, 44
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
