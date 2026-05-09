; DESCRIPTION: Creates a yellow rectangular region at (126, 112) spanning 14 by 102 pixels.
; PLAN: r0=126(x), r1=112(y), r2=14(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 112
LDI r2, 14
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
