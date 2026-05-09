; DESCRIPTION: Creates a yellow rectangular region at (433, 167) spanning 74 by 55 pixels.
; PLAN: r0=433(x), r1=167(y), r2=74(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 167
LDI r2, 74
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
