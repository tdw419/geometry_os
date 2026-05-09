; DESCRIPTION: Creates a yellow rectangular region at (39, 61) spanning 33 by 84 pixels.
; PLAN: r0=39(x), r1=61(y), r2=33(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 61
LDI r2, 33
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
