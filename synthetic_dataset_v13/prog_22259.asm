; DESCRIPTION: Creates a yellow rectangular region at (432, 50) spanning 35 by 57 pixels.
; PLAN: r0=432(x), r1=50(y), r2=35(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 50
LDI r2, 35
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
