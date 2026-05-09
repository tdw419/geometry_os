; DESCRIPTION: Creates a yellow rectangular region at (76, 177) spanning 87 by 34 pixels.
; PLAN: r0=76(x), r1=177(y), r2=87(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 177
LDI r2, 87
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
