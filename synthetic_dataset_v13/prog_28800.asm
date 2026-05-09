; DESCRIPTION: Creates a yellow rectangular region at (386, 110) spanning 39 by 57 pixels.
; PLAN: r0=386(x), r1=110(y), r2=39(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 110
LDI r2, 39
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
