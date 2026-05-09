; DESCRIPTION: Creates a yellow rectangular region at (205, 185) spanning 13 by 71 pixels.
; PLAN: r0=205(x), r1=185(y), r2=13(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 185
LDI r2, 13
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
