; DESCRIPTION: Creates a yellow rectangular region at (249, 150) spanning 11 by 88 pixels.
; PLAN: r0=249(x), r1=150(y), r2=11(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 150
LDI r2, 11
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
