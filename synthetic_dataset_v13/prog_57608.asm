; DESCRIPTION: Creates a yellow rectangular region at (110, 90) spanning 47 by 39 pixels.
; PLAN: r0=110(x), r1=90(y), r2=47(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 90
LDI r2, 47
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
