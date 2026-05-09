; DESCRIPTION: Creates a yellow rectangular region at (380, 47) spanning 98 by 88 pixels.
; PLAN: r0=380(x), r1=47(y), r2=98(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 47
LDI r2, 98
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
