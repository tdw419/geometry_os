; DESCRIPTION: Creates a yellow rectangular region at (65, 28) spanning 102 by 39 pixels.
; PLAN: r0=65(x), r1=28(y), r2=102(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 28
LDI r2, 102
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
