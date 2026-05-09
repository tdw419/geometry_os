; DESCRIPTION: Creates a yellow rectangular region at (177, 54) spanning 108 by 72 pixels.
; PLAN: r0=177(x), r1=54(y), r2=108(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 54
LDI r2, 108
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
