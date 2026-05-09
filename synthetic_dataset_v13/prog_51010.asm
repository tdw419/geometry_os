; DESCRIPTION: Creates a yellow rectangular region at (166, 47) spanning 34 by 29 pixels.
; PLAN: r0=166(x), r1=47(y), r2=34(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 47
LDI r2, 34
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
