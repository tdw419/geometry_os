; DESCRIPTION: Creates a yellow rectangular region at (248, 83) spanning 16 by 46 pixels.
; PLAN: r0=248(x), r1=83(y), r2=16(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 83
LDI r2, 16
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
