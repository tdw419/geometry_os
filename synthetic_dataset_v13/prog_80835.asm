; DESCRIPTION: Creates a yellow rectangular region at (271, 83) spanning 25 by 31 pixels.
; PLAN: r0=271(x), r1=83(y), r2=25(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 83
LDI r2, 25
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
