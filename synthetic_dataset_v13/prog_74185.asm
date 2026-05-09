; DESCRIPTION: Creates a yellow rectangular region at (112, 126) spanning 83 by 49 pixels.
; PLAN: r0=112(x), r1=126(y), r2=83(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 126
LDI r2, 83
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
